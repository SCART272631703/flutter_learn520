import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'flutter_extension.dart';

import 'pre_init.dart';
import 'jd_colors.dart';
import 'four_dio/jd_exception.dart';

const _kToastDuration = Duration(milliseconds: 1500);

get kLoadingViewSize => 50.dp;

const kLoadingView = JDLoadingView();

class JDLoadingView extends StatelessWidget {
  final Color? color;

  const JDLoadingView({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kLoadingViewSize,
      height: kLoadingViewSize,
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    );
  }
}

class JDLoadingTool {
  JDLoadingTool._();

  /// 初始化 Loading
  static Function(BuildContext context, Widget child) builder(
      BuildContext context) {
    EasyLoading.instance
      ..indicatorWidget = SizedBox(
        width: kLoadingViewSize,
        height: kLoadingViewSize,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          backgroundColor: Colors.white,
        ),
      )
      ..successWidget = SizedBox(
        width: kLoadingViewSize,
        height: kLoadingViewSize,
        child: Icon(Icons.done, color: JDColors.white, size: kLoadingViewSize),
      )
      ..errorWidget = SizedBox(
        width: kLoadingViewSize,
        height: kLoadingViewSize,
        child: Icon(Icons.clear, color: JDColors.white, size: kLoadingViewSize),
      )
      ..indicatorSize = kLoadingViewSize
      ..displayDuration = _kToastDuration
      ..userInteractions = false
      ..loadingStyle = EasyLoadingStyle.light
      ..maskColor = Colors.white
      ..indicatorColor;
    return (BuildContext context, Widget child) =>
        FlutterEasyLoading(child: child);
  }

  static isLoading() => EasyLoading.isShow;

  /// 显示 Loading
  static showLoading(
      {String? tag,
      String? status,
      Duration? duration,
      bool canCancel = false}) {
    if (duration != null) {
      Future.delayed(duration, () => dismissLoading(tag: tag));
    }
    EasyLoading.show(
        status: status,
        indicator: EasyLoading.instance.indicatorWidget,
        dismissOnTap: canCancel);
  }

  static showWhiteMaskLoading(
      {String? tag,
      String? status,
      Duration? duration,
      bool canCancel = false}) {
    if (duration != null) {
      Future.delayed(duration, () => dismissLoading(tag: tag));
    }
    EasyLoading.show(
        status: status,
        maskType: EasyLoadingMaskType.custom,
        indicator: EasyLoading.instance.indicatorWidget,
        dismissOnTap: canCancel);
  }

  /// 显示进度 Loading
  static showProgressLoading(double value, {String? tag, String? status}) {
    EasyLoading.showProgress(value, status: status);
  }

  /// 显示 Loading
  static showSuccessLoading({String? tag, String? status, Duration? duration}) {
    duration ??= EasyLoading.instance.displayDuration;
    EasyLoading.showSuccess(status ?? '', duration: duration);
    return Future.delayed(duration);
  }

  /// 显示 Loading
  static showErrorLoading({String? tag, String? status, Duration? duration}) {
    duration ??= EasyLoading.instance.displayDuration;
    EasyLoading.showError(status ?? '', duration: duration);
    return Future.delayed(duration);
  }

  /// 隐藏 Loading
  static dismissLoading({String? tag, bool force = false}) {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss(animation: false);
    }
  }
}

class TDToast {
  TDToast._();

  static _ToastView? _toastView;

  static showDebug(String content) {
    if (!kDebugMode) return;
    showToast('debug:$content');
  }

  static showError(dynamic error) async {
    if (error is JDApiException) {
      showToast(error.msg);
    } else if (error is String) {
      showToast(error);
    } else {
      showToast('$error');
    }
  }

  static showToast(String content, {Duration? duration}) async {
    _showToastLayout(
        PreInit.currentContext, content, duration ?? _kToastDuration);
    await Future.delayed(duration ?? _kToastDuration);
  }

  static _showToastLayout(
      BuildContext context, String content, Duration duration) {
    var overLayState = Overlay.of(context);
    var overlayEntry = OverlayEntry(builder: (context) => _showLayout(content));
    final toastView = _ToastView();
    _toastView?.dismiss();
    _toastView = toastView;
    _toastView!.overlayState = overLayState;
    _toastView!.overlayEntry = overlayEntry;
    _toastView!.show();
    Timer(duration, () {
      if (_toastView == toastView) {
        _toastView?.dismiss();
        _toastView = null;
      }
    });
  }

  static Widget _showLayout(String content) {
    return IgnorePointer(
      ignoring: true,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(5.dp),
          ),
          margin: EdgeInsets.symmetric(vertical: 16.dp, horizontal: 16.dp),
          padding: EdgeInsets.symmetric(vertical: 12.dp, horizontal: 12.dp),
          child: Text(content,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

class _ToastView {
  OverlayEntry? overlayEntry;
  OverlayState? overlayState;

  show() async => overlayState!.insert(overlayEntry!);

  dismiss() => overlayEntry?.remove();
}
