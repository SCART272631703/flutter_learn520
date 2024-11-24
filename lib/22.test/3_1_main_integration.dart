// 三. 集成测试
// 单元测试和Widget测试都是在测试独⽴的类或函数或Widget，它们并不能测试单独的模块形成的整体
// 或者获取真实设备或模拟器上应⽤运⾏的状态；
// 这些测试任务可以交给 集成测试 来完成；
// 集成测试需要有两个⼤的步骤:
// • 发布⼀个可测试应⽤程序到真实设备或者模拟器上；
// • 利⽤独⽴的测试套件去驱动应⽤程序，检查仪器是否完好可⽤；

// 3.1. 创建可测试应⽤程序
// 我们需要创建⼀个可以运⾏在模拟器或者真实设备的应⽤程序。
// 这⾥我直接使⽤了官⽅的示例程序，但是不同的是我这⾥给两个Widget添加了两个Key:
// • 显示数字的Text Widget：ValueKey("counter")
// • 点击按钮的FloatingActionButton Widget：key: ValueKey("increment")


import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage('Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(this.title, {super.key});
  final String title;
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              key: const ValueKey("counter"),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const ValueKey("increment"),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
