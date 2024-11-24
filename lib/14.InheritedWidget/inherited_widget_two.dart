
// 1.创建类InheritedProvide，继承于InheritedWidget，新增成员变量：父控件的satae；
// 2.在类InheritedProvide中，重写updateShouldNotify方法，并返回true，通知子widget更新其相关的依赖；
// 3.在父组件中新增Widget类型的成员变量child
// 4.在父组件中新定义of方法，该方法通过类InheritedProvide返回其新增的成员变量state，
// 让子组件通过这个of方法访问state数据；
// 5.父组件的state类的build方法中返回新建的类InheritedProvide通过构造函数创建的对象，
// 传入父组件新增成员变量child，重新build和InheritedProvide想关联的子组件；
// 6.子组件通过父组件的of方法访问父组件state里面的数据。
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InheritedWidget Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TestDemo(),
    );
  }
}

class TestDemo extends StatelessWidget {
  const TestDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return TestPage(
      child: Scaffold(
          appBar: AppBar(title: const Text('Test InheritedWidget')),
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [WidgetA(), WidgetB(), WidgetC()],
            ),
          )),
    );
  }
}

class InheritedWidgetOne extends InheritedWidget {
  const InheritedWidgetOne(
      {super.key, required super.child, required this.state});
  final TestPageState state;
  @override
  //*** 这里应该是InheritedWidgetOne，而不是InheritedWidget
  bool updateShouldNotify(InheritedWidgetOne oldWidget) {
    return true;
  }
}

class TestPage extends StatefulWidget {
  final Widget child;
  const TestPage({super.key, required this.child});
  //***  这里要返回TestPageState类型，而不是State类型
  @override
  TestPageState createState() {
    return TestPageState();
  }

  static TestPageState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedWidgetOne>()
            as InheritedWidgetOne)
        .state;
  }
}

//***  这里要加上<TestPage>
class TestPageState extends State<TestPage> {
  int count = 0;
  void increaseCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedWidgetOne(state: this, child: widget.child);
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('现在的个数'),
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({super.key});
  @override
  Widget build(BuildContext context) {
    final state = TestPage.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: Text('${state.count}'),
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({super.key});
  @override
  Widget build(BuildContext context) {
    final state = TestPage.of(context);
    return SizedBox(
        height: 50,
        width: 100,
        child: IconButton(
            onPressed: () {
              state.increaseCount();
            },
            icon: const Icon(Icons.add)));
  }
}
