// main()函数（Dart程序的⼊⼝函数）执⾏完后，消息
// 循环机制就会启动。main中的代码将最先执⾏，然后再执⾏
// 微任务队列中的任务（按FIFO先进先出顺序），再次是事件
// 队列中的任务。执⾏顺序：Main > MicroTask > 
// EventQueue。在事件任务执⾏过程中⼜可以插⼊新的微任务
// 和事件任务，所有任务执⾏完毕程序就会退出。
// 有意思的是在事件循环中，当某个任务发⽣异常并没有被捕
// 获时，程序并不会退出。⽽直接导致的结果是当前任务的后
// 续代码不会被执⾏。也就是说⼀个任务中的异常是不会影响
// 其它任务执⾏的。

// Flutter 异常分类
// 1. Flutter dart代码异常（包含app 代码异常，和
// framework部分异常，和未处理的异步异常）
// 2. Flutter Engine 异常



// Flutter异常捕获⽅式
// • 同步异常捕获
// 同步捕获：使⽤try catch
//  try {
//  throw FlutterError('同步异常');
//  } catch (e) {
//  print(e);
//  }
// • 异步异常捕获
// ⽅法1：
// 使⽤Flutter提供的catchError捕获
//  Future.delayed(Duration(seconds: 1)).then((value) {
//  throw FlutterError('异步异常');
//  }).catchError((e) {
//  print(e);
//  });
// ⽅法2：
// 将异步转为同步捕获
//  try {
//  await Future.delayed(Duration(seconds: 1), () {
//  throw FlutterError('异步');
//  });
//  } catch (e) {
//  print(e);
//  }
// • 全局捕获
// Dart有个Zone的概念，可以简单的理解为沙箱。不同的
// Zone相处独⽴，互不影响。借助于Zone就可以指定代码的
// 执⾏环境，捕获、拦截或者修改代码⾏为。Flutter中有⼀个
// Zone.runZoned⽅法。
// ⽅法1：
// 在⼊⼝函数main⾥全局捕获
// void main() {
//  HiDefend.run(MyApp());
// }
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HiDefend {
  /// 全局异常捕获
  static run(Widget app) {
    /// 捕获flutter框架异常
    FlutterError.onError = (FlutterErrorDetails details) {
      if (kReleaseMode) {
        // 线上环境，⾛上报逻辑
        Zone.current.handleUncaughtError(details.exception, details.stack!);
      } else {
        // 开发环境，⾛console抛出
        FlutterError.dumpErrorToConsole(details);
      }
    };

    /// 捕获程序异常
    runZonedGuarded(() {
      runApp(app);
    }, (e, s) => _reportError(e, s));
  }

  /// 通过接⼝上报异常
  static _reportError(Object e, StackTrace s) {
    print('error');
    print('StackTrace');
  }
}




// ⽅法2：
// 使⽤bugly的flutter插件捕获
// dependencies:
//  flutter_bugly: ^0.3.3

