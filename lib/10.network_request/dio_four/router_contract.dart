import 'package:flutter/material.dart';
import 'flutter_extension.dart';
import 'router_util.dart';
import 'jd_log.dart';

typedef ContractWidgetBuilder = Widget Function(
    BuildContext context, Map<String, dynamic> params);

/// 路由协议
@immutable
class RouterContract {
  final String name;
  final ContractWidgetBuilder builder;

  const RouterContract(this.name, this.builder);

  Future<Map<String, dynamic>?> push(
    BuildContext context, {
    Map<String, dynamic>? params,
    bool fullscreenDialog = false,
    bool hideAnimation = false,
    bool replacement = false,
  }) {
    jdLog('路由push name ---->  $name');
    return pushContractPage(context, params,
        replacement: replacement,
        fullscreenDialog: fullscreenDialog,
        hideAnimation: hideAnimation);
  }

  Future<Map<String, dynamic>?> pushReplacement(BuildContext context,
      {Map<String, dynamic>? params}) {
    return pushContractPage(context, params, replacement: true);
  }

  Future<Map<String, dynamic>?> pushContractPage(
    BuildContext context,
    Map<String, dynamic>? params, {
    required bool replacement,
    bool fullscreenDialog = false,
    bool hideAnimation = false,
  }) {
    registerRouter();
    final routePage =
        RouterUtil.createRoute<Map<String, dynamic>, Map<String, dynamic>>(
            this, RouteSettings(name: name, arguments: params),
            fullscreenDialog: fullscreenDialog, hideAnimation: hideAnimation);
    if (replacement) {
      return Navigator.pushReplacement(context, routePage);
    } else {
      return Navigator.push(context, routePage);
    }
  }

  pop(BuildContext context, [Map<String, dynamic>? result]) {
    registerRouter();
    // TDLoggerUtil.d('RouterContract($name) pop context:$context result:$result');
    Navigator.pop(context, result);
  }

  registerRouter() {
    if (RouterUtil.routerMap.get(name) != null) return;
    // TDLoggerUtil.d('RouterContract($name) registerRouter');
    return RouterUtil.registerSingle(this);
  }
}
