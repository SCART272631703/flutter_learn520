// import "dart:io";
// import 'dart:async';

// //1.事件循环的伪代码，会crash的代码
// test1() {
//   List<int> eventQueue = [1, 2, 3];
//   var event;
// // 事件循环从启动的⼀刻，永远在执⾏
//   while (true) {
//     if (eventQueue.isNotEmpty == true) {
//       // 取出⼀个事件
//       event = eventQueue.removeAt(0);
//       // 执⾏该事件
//       event();
//     }
//   }
// }

// // 2. 同步的⽹络请求
// test2() {
//   String getNetworkData() {
//     sleep(Duration(seconds: 3));
//     return "network data";
//   }

//   print("main function start");
//   print(getNetworkData());
//   print("main function end");
// }

// // 3.异步的⽹络请求
// test3() {
//   Future<String> getNetworkData() {
//     return Future<String>(() {
//       sleep(Duration(seconds: 3));
//       return "network data";
//     });
//   }

//   print("main function start");
//   print(getNetworkData());
//   print("main function end");
// }

// // 4. 通过.then的回调，获取Future得到的结果
// test4() {
//   Future<String> getNetworkData() {
//     return Future<String>(() {
//       sleep(Duration(seconds: 3));
//       return "network data";
//     });
//   }

//   print("main function start");
//   // 使⽤变量接收getNetworkData返回的future
//   var future = getNetworkData();
//   // 当future实例有返回结果时，会⾃动回调then中传⼊的函数
//   // 该函数会被放⼊到事件循环中，被执⾏
//   future.then((value) {
//     print(value);
//   });
//   print(future);
//   print("main function end");
// }

// // 5. 获取到异常网络请求的信息
// test5() {
//   Future<String> getNetworkData() {
//     return Future<String>(() {
//       sleep(Duration(seconds: 3));
//       // 不再返回结果，⽽是出现异常
//       // return "network data";
//       throw Exception("⽹络请求出现错误");
//     });
//   }

//   print("main function start");
//   var future = getNetworkData();
//   future.then((value) {
//     print(value);
//   }).catchError((error) {
//     // 捕获出现异常时的情况
//     print(error);
//   });
//   print(future);
//   print("main function end");
// }

// // 6. ⽤同步的代码格式，去实现异步的调⽤过程
// //  await关键字必须存在于async函数中， 使⽤async标记的函数，必须返回⼀个Future对象
// test6() {
//   Future<String> getNetworkData() async {
//     var result = await Future.delayed(const Duration(seconds: 3), () {
//       return "network data";
//     });
//     return "请求到的数据：$result";
//   }
// }

// void main(List<String> args) {
//   test1();
//   test2();
//   test3();
//   test4();
//   test5();
//   test6();
// }
