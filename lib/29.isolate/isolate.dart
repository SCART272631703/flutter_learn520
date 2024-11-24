// // 在Dart/Flutter应⽤程序启动时，会启动⼀个主线程其实也就是Root Isolate,
// // 在Root Isolate内部运⾏⼀个EventLoop事件循环。所以所有的Dart代码都是运⾏在Isolate之中的，
// // 它就像是机器上的⼀个⼩空间，具有⾃⼰的私有内存块和⼀个运⾏事件循环的单个线程。
// // isolate是提供了Dart/Flutter程序运⾏环境，包括所需的内存以及事件循环EventLoop对事件队
// // 列和微任务队列的处理。

// // 「isolate实际就是⼀个隔离的Dart执⾏的上下⽂环境(或者容器)」。「isolate是有⾃⼰的内存和单线程控制的事件循
// // 环」。是⼀条独⽴的执⾏线，它们之间只能通过发送消息通信，所以它的资源开销低于线程。
// // isolate中的代码是按顺序执⾏的，「任何Dart程序的并发都是运⾏多个isolate的结果」。
// // 因为 「Dart没有共享内存的并发」，没有竞争的可能性所以不需要锁，也就不存在死锁的问题。
// // isolate和Thread线程唯⼀不⼀样的就是 「多个isolate之间彼此隔离且不共
// // 享内存空间，每个isolate都有⾃⼰独⽴内存空间，从⽽避免
// // 了锁竞争」。它们之间的通信就是 「基于Actor并发模型中发送异步消息来实现通信的」，
// // 在isolate中还有「Port」的概念，分为send port和receive port

// // 3.如何使⽤isolate
// // 使⽤isolate类进⾏并发操作，需要导⼊ isolate
// // import 'dart:isolate';
// // 该Library主要包含下⾯:
// // • Isolate 类: Dart代码执⾏的隔离的上下⽂环境
// // • ReceivePort 类: 它是⼀个接收消息的 Stream ，ReceivePort 可以⽣成 SendPort ,
// // ReceivePort 接收消息，可以把消息发送给其他的 isolate, 所以要发送消息就需
// // 要⽣成 SendPort , 然后再由 SendPort 发送给对应isolate的 ReceivePort .
// // • SendPort 类: 将消息发送给isolate, 准确的来说是将消息发送到isolate中的 ReceivePort
// // 此外可以使⽤ spawn ⽅法⽣成⼀个新的 isolate 对象， spawn
// // 是⼀个静态⽅法返回的是⼀个 Future<Isolate> , 必传参数有
// // 两个，函数 entryPoint 和参数 message ,其中 entryPoint函数
// // 必须是顶层函数或静态⽅法，参数message需要包含
// // SendPort
// // //3.2 isolate单向通信
// import "dart:isolate";

// void main() async {
//   // 1.创建管道
//   ReceivePort receivePort = ReceivePort();
//   // 2.创建新的Isolate
//   Isolate isolate = await Isolate.spawn<SendPort>(foo, receivePort.sendPort);
//   // 3.监听管道消息
//   receivePort.listen((data) {
//     print('单向通信Data：$data');
//     // 不再使⽤时，我们会关闭管道
//     receivePort.close();
//     // 需要将isolate杀死
//     isolate.kill(priority: Isolate.immediate);
//   });
// }

// void foo(SendPort sendPort) {
//   sendPort.send("Hello World");
// }

// // // 3.3 isolate双向通信
// // 双向通信
// // Flutter提供了⽀持并发计算的compute函数，它内部封装了Isolate的
// // 创建和双向通信；利⽤它我们可以充分利⽤多核⼼CPU，并且使⽤起来也⾮常简单
// import 'dart:async';
// import 'dart:isolate';

// Future<SendPort> initIsolate() async {
// //返回值是被Future包裹的SendPort类型的数据
//   print('initIsolate == ${Isolate.current.debugName}');
//   Completer<SendPort> completer = Completer<SendPort>();
//   //1.创建主isolate中的接收者（接收⼦isolate中发送的消息）
//   ReceivePort mainReceivePort = ReceivePort();
//   //接受者的监听
//   mainReceivePort.listen((data) {
//     if (data is SendPort) {
//       //2.接收到⼦isolate中创建的 SendPort，可使⽤该SendPort向⼦isolate发送消息
//       SendPort newSendPort = data;
//       //completer 完成符, 接收并返回被Future包裹的newReceivePort.sendPort
//       //complete将newSendPort封装成Future，由 return completer.future;返回该值
//       completer.complete(newSendPort);
//     } else {
//       print('[newIsolateToMainStream] $data');
//     }
//   });
//   //3.创建⼦isolate，传⼊⼊⼝函数 和 接受者sendPort ，⼦isolate可使⽤该sendPort向主isolate发送消息
//   Isolate newIsolateInstance =
//       await Isolate.spawn(newIsolate, mainReceivePort.sendPort);
//   print('newIsolateInstance == ${newIsolateInstance.debugName}');
//   return completer.future;
// }

// /// ⼦Isolate的⼊⼝函数，可以在该函数中做耗时操作
// void newIsolate(SendPort mainSendPort) {
//   print('newIsolate == ${Isolate.current.debugName}');
//   ReceivePort newReceivePort = ReceivePort();
//   //4.子isolate使用mainReceivePort.sendPort向主isolate发送newReceivePort.sendPort
//   // 主isolate只接收来自mainSendPort发送的数据（发送的数据类型包括SendPort）
//   mainSendPort.send(newReceivePort.sendPort);
//   //5.子isolate通过newReceivePort监听数据
//   newReceivePort.listen((data) {
//     print('[mainToNewIsolateStream] $data');
//     var sum = 0;
//     for (int i = 1; i <= data; i++) {
//       sum += i;
//     }
//     // 子isolate使用mainReceivePort.sendPort向主发送计算结果
//     mainSendPort.send('计算结果：$sum');
//   });
// }

// void twoWaystart() async {
//   SendPort newSendPort = await initIsolate();
//   //接收到⼦ioslate中的 SendPort 可向⼦isolate中发送消息
//   //主isolate接收到ioslate发送子的SendPort，子的sendPort向子isolate的receivePort发送消息1000000000
//   newSendPort.send(1000000000);
// }

// void main(List<String> args) {
//   twoWaystart();
// }

// 3.5 compute函数
// 创建⼀个新的Isolate，在其中运⾏任务doWork

import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

Future<String> createNewTask(int count) async {
  var result = await compute(doWork, count);
  print(result);
  return result;
}

String doWork(int count) {
  print('new isolate doWork start == ${DateTime.now()}');
  // 模拟耗时5秒
  sleep(const Duration(seconds: 5));
  summ(count);
  print('new isolate doWork end == ${DateTime.now()}');
  return "complete:$count";
}

//计算0到 num 数值的总和
int summ(int num) {
  print('开始计算');
  int count = 0;
  while (num > 0) {
    count = count + num;
    num--;
  }
  print('计算结束');
  return count;
}

main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("HelloWorld"),
        ),
        body: const HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint("HomeBody build");
    return MyCounterWidget();
  }
}

class MyCounterWidget extends StatefulWidget {
  MyCounterWidget({super.key}) {
    debugPrint("执⾏了MyCounterWidget的构造⽅法");
  }

  @override
  State<StatefulWidget> createState() {
    // 将创建的State返回
    return MyCounterState();
  }
}

class MyCounterState extends State<MyCounterWidget> {
  int counter = 10000;
  String str = 'New Task';
  MyCounterState() {
    debugPrint("执⾏MyCounterState的构造⽅法");
  }
  @override
  void initState() {
    super.initState();
    debugPrint("执⾏MyCounterState的init⽅法");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("执⾏执⾏MyCounterState的build⽅法");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "当前计数：$str",
            style: const TextStyle(fontSize: 30),
          ),
          TextButton(
            // color: Colors.redAccent,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.redAccent),
            ),
            child: const Text(
              "计算",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                str = createNewTask(counter).toString();
              });
            },
          ),
        ],
      ),
    );
  }
}
