// // 1.单订阅流.asBroadcastStream()
// // • StreamController.stream本身是单订阅流 ,只能被订阅⼀次.
// // • StreamController.stream.asBroadcastStream()将单订阅流转成了多订阅流,但是流本身还是
// // StreamController.stream的流,所以下⾯代码如果先订阅⼀次StreamController.stream,再订阅⼀次
// // StreamController.stream.asBroadcastStream(), 代码依然会崩溃.

// import 'dart:async';

// void main(List<String> args) {
//   StreamController controller2 = StreamController();
//   Stream broadcastStream = controller2.stream.asBroadcastStream();
// // controller2.stream.listen((event) {
// // print("listen0--");//controller2.stream单订阅流 只能被订阅⼀次 Bad state: Stream has already been listened to.
// // });
//   broadcastStream.listen((event) {
//     print("listen1--" + event);
//   });
//   broadcastStream.listen((event) {
//     print("listen2--" + event);
//   });
//   controller2.add("broadcastStream");
//   controller2.close();
// }



// //2.StreamController.broadcast()
// import 'dart:async';
// void main(List<String> args) {
//   StreamController controller3 = StreamController.broadcast();
//   controller3.stream.listen((event) {
//     print("listen1--" + event);
//   });
//   controller3.stream.listen((event) {
//     print("listen2--" + event);
//   });
//   controller3.add("StreamController.broadcast");
//   controller3.close();
// }

// 3.StreamBuilder的⽤法
// • StreamBuilder本身就是⼀个widget
// • StreamBuilder需要传⼊⼀个stream,通过stream内部不同的value值,builder中可以返回不同的widget
// • 可实现局部控件刷新

import 'package:flutter/material.dart';
import 'dart:async';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('streamBuilder'),
        ),
        body: const StreamPage(),
      ),
    );
  }
}

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});
  @override
  State<StreamPage> createState() {
    return StreamPageState();
  }
}

class StreamPageState extends State<StreamPage> {
  StreamController<String> builderController = StreamController();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      builderController.add("我变化了");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<String>(
          stream: builderController.stream,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Text('${snapshot.data}')
                : const Text('waiting for data');
          }),
    );
  }

  @override
  void dispose() {
    builderController.close();
    super.dispose();
  }
}
