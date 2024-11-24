// Stream是Dart中⾃带的封装,代表着事件流.
// 根据可订阅数,可以分为:
// • 单订阅流
// 单个订阅流在流的整个⽣命周期内仅允许有⼀个listener。它在有收听者之前不会⽣成事件，并且在取
// 消收听时它会停⽌发送事件，即使你仍然在Sink.add更多事件。即使在第⼀个订阅被取消后，也不允许在单个
// 订阅流上进⾏两次侦听.

// Future<String> getData(int i) async {
//   return "fromFutures$i";
// }

// void main(List<String> args) {
//   Stream<String> stream0 = Stream.fromFuture(getData(0));
//   stream0.listen((event) {
//     print(event);
//   }, onError: (msg) {
//     print("fromFuture--error=" + msg);
//   }, onDone: () {
//     print("fromFuture--done");
//   });
// }

// 2.fromFutures()
//• 接收Future对象数组作为参数

// Future<String> getData(int i) async {
//   return "fromFutures$i";
// }

// void main(List<String> args) {
//   List<Future<String>> list = [getData(1), getData(2), getData(3)];
//   Stream<String> stream1 = Stream.fromFutures(list); //接收⼀个Future集合对象作为参数
//   stream1.listen((event) {
//     print(event);
//   }, onError: (msg) {
//     print("fromFuture--error=$msg");
//   }, onDone: () {
//     print("fromFutures--done");
//   });
// }

// // 3.利⽤StreamController
// // • 可以通过sink添加事件
// // • 可以添加错误事件,订阅者在onError回调中可以拿到这个错误信息.
// import 'dart:async';
// import 'package:flutter/widgets.dart';
// void main(List<String> args) {
//   StreamController<String> controller = StreamController<String>();
//   controller.add("StreamController--add");
//   controller.sink.add("StreamController--sink.add");
//   // controller.addError("error信息");
//   StreamSubscription<String> streamSubscription =
//       controller.stream.listen((event) {
//     debugPrint(event);
//   }, onError: (msg) {
//     debugPrint("StreamController--error= $msg");
//   }, onDone: () {
//     debugPrint("StreamController--done");
//   });

//   streamSubscription.onDone(() {
//     debugPrint("done");
//   });
//   controller.close(); //不关闭会警告
//   // streamSubscription.cancel();//不cancel会警告
// }
// // StreamController使⽤完成,需要close()
// // StreamSubscription需要cancle() (在此例中,streamSubscription.cancel()了,
// // 订阅者就收不到消息了,所以实际使⽤时⼀般可在State的dispose⽅法中调⽤)

// // 4.async*异步⽣成器
// Stream<int> countStream(int to) async* {
//   for (int i = 1; i <= to; i++) {
//     yield i;
//   }
// }
// void main(List<String> args) {
//   countStream(9).listen((event) {
//     print(event);
//   }, onError: (error) {
//     print(error);
//   }, onDone: (){

//   }
//   );
// }

// //async*异步⽣成器
// Stream<int> countStream(int to) async* {
//   for (int i = 0; i <= to; i++) {
//     yield i;
//   }
// }

// void main(List<String> args) {
//   countStream(9).where((event) => event % 2 == 0).listen((event) {
//     //筛选
//     print("where-(event % 2 == 0)--$event");
//   });
// }

// // map
// /// 返回从1-》to的序列流
// import 'dart:async';
// Stream<int> countStream(int to) async* {
//   //async*异步⽣成器
//   for (int i = 1; i <= to; i++) {
//     yield i;
//   }
// }
// void main(List<String> args) {
//   countStream(9).map((event) => event * 2).listen((event) {
//     //变换*2
//     print("map变换-event * 2 == 0--$event");
//   });
// }

// take
// import 'dart:async';
//   Stream<int> countStream(int to) async* {
//     //async*异步⽣成器
//     for (int i = 1; i <= to; i++) {
//       yield i;
//     }
//   }
// void main(List<String> args) {
//   /// 返回从1-》to的序列流
//   countStream(9).take(4).listen((event) {
//     //指定只发送4个事件
//     print("take-只发送4个事件 == 0--$event");
//   });
// }

// // transform sink 下沉，坐下，减弱
// /// 返回从1-》to的序列流
// /// 
// import 'dart:async';
// Stream<int> countStream(int to) async* {
//   //async*异步⽣成器
//   for (int i = 1; i <= to; i++) {
//     yield i;
//   }
// }

// void main(List<String> args) {
//   final transformer = StreamTransformer<int, String>.fromHandlers(
//     handleData: (data, sink) {
//       if (data == 9) {
//         sink.add("是$data吗？你猜对了");
//       } else {
//         sink.add("是$data吗？还没猜中，再试一次吧");
//       }
//     },
//   );
//   countStream(9).transform(transformer).listen((value) {
//     print(value);
//   }, onError: (error) {
//     print(error);
//   });
// }
