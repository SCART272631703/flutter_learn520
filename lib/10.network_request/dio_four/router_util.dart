import 'dart:io';

import 'package:flutter/material.dart';
import 'flutter_extension.dart';
import 'router_contract.dart';

import 'empty_page.dart';
import 'jd_page_route.dart';

class RouterUtil {
  RouterUtil._();

  static Route<Result> createInternalRoute<Args, Result>(
      RouterContract? contract,
      RouteSettings settings,
      bool fullscreenDialog,
      bool hideAnimation) {
    builder(BuildContext context) {
      final params = (settings.arguments as Map<String, dynamic>?) ?? {};
      return (contract?.builder.call(context, params) ?? const BlankPage());
    }

    if (hideAnimation) {
      if (Platform.isIOS) {
        return NoAnimationContractIosRoute(
            settings: settings,
            builder: builder,
            fullscreenDialog: fullscreenDialog);
      } else {
        return NoAnimationContractRoute(
            settings: settings,
            builder: builder,
            fullscreenDialog: fullscreenDialog);
      }
    } else {
      if (Platform.isIOS) {
        return ContractIosRoute(
            settings: settings,
            builder: builder,
            fullscreenDialog: fullscreenDialog);
      } else {
        return ContractRoute(
            settings: settings,
            builder: builder,
            fullscreenDialog: fullscreenDialog);
      }
    }
  }

  static Route<Result> createRoute<Args, Result>(
      RouterContract? contract, RouteSettings settings,
      {bool fullscreenDialog = false, bool hideAnimation = false}) {
    return createInternalRoute(
        contract, settings, fullscreenDialog, hideAnimation);
  }

  static final Map<String, RouterContract> _routerMap =
      <String, RouterContract>{};

  static Map<String, RouterContract> get routerMap => _routerMap;

  // 注册路由
  static register(List<RouterContract> map) {
    for (var element in map) {
      registerSingle(element);
    }
  }

  static registerSingle(RouterContract contract) {
    RouterContract? router = _routerMap.get(contract.name);
    // 当前路由已注册
    if (router != null) {
      throw FlutterError(
        '\n路由的名称冲突了:'
        '\n已定义的路由 ${router.runtimeType}'
        '\n新定义的路由 ${contract.runtimeType} ',
      );
    }
    _routerMap[contract.name] = contract;
  }

  static RouteFactory routeFactory = (RouteSettings settings) {
    final routerContract = _routerMap.get(settings.name);
    return createRoute(routerContract, settings);
  };

  /// 一直弹出到主页,默认 ['/tDTabNavigator']
  static popUntil(BuildContext context, [String? routerName]) {
    final name = routerName ?? '/tDTabNavigator';
    Navigator.popUntil(context, (Route<dynamic> r) {
      return r.settings.name == name || r.isFirst;
    });
  }

  /// 一直弹出到根节点
  static goRoot(BuildContext context) {
    Navigator.popUntil(context, (Route<dynamic> r) => r.settings.name == '/');
  }

  /// 尝试返回上个页面(可以被[]中止)
  static Future<bool> maybePop(BuildContext context, [result]) async =>
      Navigator.maybePop(context, result);

  /// 返回上个页面
  static pop(BuildContext context, [result]) => Navigator.pop(context, result);
}
