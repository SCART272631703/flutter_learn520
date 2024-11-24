import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'flutter_extension.dart';

import 'jd_log.dart';

/// 判断网络是否连接
Future<bool> tdNetworkConnected() async {
  var connectResult = await (Connectivity().checkConnectivity());
  jdLog('tdNetworkConnected   $connectResult');
  return !connectResult.contains(ConnectivityResult.none);
}

class JDDevice {
  static bool isIOS = Platform.isIOS;
  static bool isAndroid = Platform.isAndroid;
  static double width = ScreenUtil().screenWidth;
  static double height = ScreenUtil().screenHeight;

  // AppBar高度
  static double appBarHeight = 44.dp;

  // statusBarHeight + AppBar  高度
  static double topTotalHeight = (ScreenUtil().statusBarHeight + 44.dp);

  //顶部状态栏高度
  static double statusBarHeight = ScreenUtil().statusBarHeight;
  // 底部安全区域高度
  static double bottomBarHeight = ScreenUtil().bottomBarHeight;
}
