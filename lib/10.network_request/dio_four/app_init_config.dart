import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'jd_device.dart';
import 'four_dio/base_request_param.dart';
import 'jd_log.dart';

import 'four_dio/jd_request.dart';

// 网络变化
NetWorkChangeNotifier kNetChangeNotifier =
    NetWorkChangeNotifier(ConnectivityResult.none);

class NetWorkChangeNotifier extends ValueNotifier<ConnectivityResult> {
  NetWorkChangeNotifier(super.value);
}

class AppInitConfig {
  static AppInitConfig? _instance;
  static AppInitConfig get instance => _getOrCreateInstance();
  static AppInitConfig _getOrCreateInstance() {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AppInitConfig._();
      return _instance!;
    }
  }

  AppInitConfig._() {
    connectListener();
  }

  static const String kConfigCacheKey = 'kConfigCacheKey';

  static setStatusBarLight(bool isLight) {
    if (JDDevice.isAndroid) {
      Brightness brightness = isLight ? Brightness.light : Brightness.dark;

      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      //     overlays: [SystemUiOverlay.top]);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        // 顶部状态栏
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: brightness,
        // 底部bar
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: null,
        systemNavigationBarIconBrightness: Brightness.light,
      ));
    } else if (JDDevice.isIOS) {
      Brightness brightness = isLight ? Brightness.dark : Brightness.light;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: brightness,
      ));
    }
  }

  BaseRequestParam requestParam = BaseRequestParam();

  updateBaseMap() {
    requestParam.updateOnceBaseMap();
  }

  bool hasNet = true;

  initConfig() {
    initDio();
    initBugly();
  }

  // 真机上可以初始化bugly
  Future<void> initBugly() async {
    // FlutterBuglyPlugin.init(
    //   appIdAndroid: "",
    //   appIdiOS: "",
    // );
    final onError = FlutterError.onError;

    FlutterError.onError = (FlutterErrorDetails details) {
      onError?.call(details);
      if (needReport()) {
        // FlutterBuglyPlugin.reportException(
        //     exceptionName: details.exceptionAsString(),
        //     reason: details.stack.toString());
      } else {
        jdLog(
            'errortype------1 details.exceptionAsString()---${details.exceptionAsString()} '
            'details.stack ---${details.stack.toString()} }');
      }
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      if (needReport()) {
        // FlutterBuglyPlugin.reportException(
        //     exceptionName: error.toString(), reason: stack.toString());
      } else {
        jdLog(
            'errortype------2 details.exceptionAsString()---${error.toString()} '
            'details.stack ---${stack.toString()} }');
      }
      return true;
    };
  }

  bool firstNoNet = false;
  StreamSubscription? netSubscription;

  /// 设置网络切换监听
  connectListener() {
    netSubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      var result = results.first;
      bool isWifi = (result == ConnectivityResult.wifi);
      bool hasNet = (result != ConnectivityResult.none);

      if (!firstNoNet) {
        firstNoNet = true;
        // 首次回调没网 过滤掉
        if (!hasNet) {
          jdLog("如果首次回调没网 过滤掉---> $result  $isWifi");
          return;
        }
      }
      if (kNetChangeNotifier.value != result) {
        AppInitConfig.instance.hasNet = hasNet;
        jdLog("最开始connectListener网络状态---> $result  $isWifi");
        AppInitConfig.instance.updateBaseMap();
        kNetChangeNotifier.value = result;
      }
    });
  }

  static bool needReport() {
    return kReleaseMode;
  }

  void initDio() {
    // base url
    JDApiRequest.apiServiceUrl =
        'https://gitee.com/kuaipai/jd_response_json/raw/master/';
    // 请求头放这里
    JDApiRequest.httpHeaders = () {
      return AppInitConfig.instance.requestParam.getRequestMap();
    };
  }
}

// dio网络代理抓包设置
class TDSetProxyRequest {
  void setProxy(String? proxyIP, String? proxyPort) {
    String? localProxy = "PROXY $proxyIP:$proxyPort";
    jdLog("localProxy=$localProxy");
    (TDDioInstance().dio.httpClientAdapter as IOHttpClientAdapter)
        .onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) {
        return true;
      };
      client.findProxy = (uri) {
        //  "PROXY 192.168.1.1:8888";
        return localProxy;
      };
      return null;
    };
  }
}
