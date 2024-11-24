// InheritedWidget 提供⼀种在 widget 树中从上到下共享数据
// 的⽅式，但是也有很多场景数据流向并⾮从上到下，⽐如从
// 下到上或者横向等。为了解决这个问题，Flutter 提供了⼀个
// ValueListenableBuilder 组件，它的功能是监听⼀个数据源，
// 如果数据源发⽣变化，则会重新执⾏其 builder。

import 'package:flutter/material.dart';

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
      home: const FourthDemo(),
    );
  }
}

///直接调⽤SetState
class FourthDemo extends StatefulWidget {
  const FourthDemo({super.key});
  @override
  State<StatefulWidget> createState() {
    return _FourthDemoState();
  }
}

class _FourthDemoState extends State<FourthDemo> {
  int counter = 0;
  void incrementCounter() {
    counter++;
    counterNotifier.value = counter;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("Dependencies change");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FirstDemo'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          WidgetA(),
          WidgetB(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint('----------WidgetA build------');
    return const Center(
      child: Text(
        'You have pushed the button this many times:',
      ),
    );
  }
}

// 1. 创建一个全局的ValueNotifier对象；
// 2. 使用ValueListenableBuilder封装需要重新build的控件，
//    并传入创建的全局的ValueNotifier对象。
// 3. 改变counterNotifier.value的值，重新build控件。
ValueNotifier<int> counterNotifier = ValueNotifier<int>(0);

class WidgetB extends StatelessWidget {
  const WidgetB({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint('----------WidgetB build------');
    return ValueListenableBuilder<int>(
        valueListenable: counterNotifier,
        builder: (BuildContext context, int counterr, widgetChild) {
          debugPrint('----------ValueListenableBuilder build------');
          return Text(
            '$counterr',
            style: Theme.of(context).textTheme.displayMedium,
          );
        });
  }
}
