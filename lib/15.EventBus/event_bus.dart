// 3.2. StatelessWidget的实现
// 在组件之间如果需要传递事件，⼀⽅⾯可以⼀层层来传递，另⼀⽅⾯我们可以使⽤EventBus跨组件通信的方式来完成。
// • EventBus相当于是⼀种订阅者模式，通过⼀个全局的对象来管理；
// • 这个EventBus我们可以⾃⼰实现，也可以使⽤第三⽅的EventBus；
// 第⼀：我们需要定义⼀个希望在组件之间传递的对象；
// 第⼆：创建⼀个全局的EventBus对象；
// 第三：监听数据源的改变；
// 第四：在某个Widget中，发出事件。

import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

class UserInfo {
  String nickname;
  int level;
  UserInfo(this.nickname, this.level);
}

final eventBus = EventBus();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<MyHomePage> {
  String message = "Hello Coderwhy";
  @override
  void initState() {
    eventBus.on<UserInfo>().listen((data) {
      setState(() {
        message = "${data.nickname}-${data.level}";
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Key"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(message),
      )),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            var info = UserInfo('why', 18);
            eventBus.fire(info);
          }),
    );
  }
}
