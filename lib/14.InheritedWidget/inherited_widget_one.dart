import 'package:flutter/material.dart';

// 1.创建类InheritedProvide，继承于InheritedWidget，新增成员变量：父控件的satae；
// 2.在类InheritedProvide中，重写updateShouldNotify方法，并返回true，通知子widget更新其相关的依赖；
// 3.在父组件中新增Widget类型的成员变量child
// 4.在父组件中新定义of方法，该方法通过类InheritedProvide返回其新增的成员变量state，
// 让子组件通过这个of方法访问state数据；
// 5.父组件的state类的build方法中返回新建的类InheritedProvide通过构造函数创建的对象，
// 传入父组件新增成员变量child，重新build和InheritedProvide想关联的子组件；
// 6.子组件通过父组件的of方法访问父组件state里面的数据。
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
      home: const SecondDemo(),
    );
  }
}

//用 SecondDemo 封装 TestPage
class SecondDemo extends StatelessWidget {
  const SecondDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return TestPage(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('InheritedWidget Demo'),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            WidgetA(),
            WidgetB(),
            WidgetC(),
          ],
        ),
      ),
    );
  }
}
// 1.创建类InheritedProvide，继承于InheritedWidget，新增成员变量：父控件的satae；

class InheritedProvide extends InheritedWidget {
  ///数据共享
  const InheritedProvide({
    super.key,
    required super.child,
    required this.state,
  });
  final TestPageState state; // 被共享的状态
  @override
  //updateShouldNotify对⽐新旧InheritedProvide，是否需要更新相关依赖的Widget
  // 2.在类InheritedProvide中，重写updateShouldNotify方法，并返回true，通知子widget更新其相关的依赖；
  bool updateShouldNotify(InheritedProvide oldWidget) {
    return true;
  }
}

class TestPage extends StatefulWidget {
  final Widget child;
  const TestPage({
    super.key,
    required this.child,
  });
  // 3.在父组件中新增Widget类型的成员变量child
  @override
  TestPageState createState() => TestPageState();
  // 4.在父组件中定义of方法，该方法通过类InheritedProvide返回其新增的成员变量state，让子组件通过这个of方法访问state数据；
  static TestPageState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedProvide>()
            as InheritedProvide)
        .state;
  }

//   static TestPageState of(BuildContext context, {bool rebuild = true}) {
//     //调⽤inheritFromWidgetOfExactType() 和
// // ancestorWidgetOfExactType()的区别就是前者会注册
// // 依赖关系，⽽后者不会，所以在调⽤
// // inheritFromWidgetOfExactType()时，InheritedWidget
// // 和依赖它的⼦孙组件关系便完成了注册，之后当
// // InheritedWidget发⽣变化时，就会更新依赖它的⼦孙组
// // 件，也就是会调这些⼦孙组件的build()⽅法。⽽当调⽤
// // 的是 ancestorWidgetOfExactType()时，由于没有注册
// // 依赖关系，所以之后当InheritedWidget发⽣变化时，
// // 就不会更新相应的⼦孙Widget
//     if (rebuild) {
//       // ignore: deprecated_member_use
//       return (context.dependOnInheritedWidgetOfExactType<InheritedProvide>()
//               as InheritedProvide)
//           .state;
//     }
//     // ignore: deprecated_member_use
//     return (context.findAncestorWidgetOfExactType<InheritedProvide>()
//             as InheritedProvide)
//         .state;
//   }
}

class TestPageState extends State<TestPage> {
  int counter = 0;
  void incrementPageCounter() {
    debugPrint('----------incrementPageCounter------');
    setState(() {
      debugPrint('----------setState------');
      counter++;
    });
  }
// 5.父组件的state类的build方法中返回新建的类InheritedProvide通过构造函数创建的对象
  @override
  Widget build(BuildContext context) {
    debugPrint('----------TestPageState build------');
    return InheritedProvide(
      state: this,
      child: widget.child,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //⽗或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调⽤。
    //如果build中没有依赖InheritedWidget，则此回调不会被调⽤。
    debugPrint("------ Dependencies change ------");
  }
}





class WidgetA extends StatelessWidget {
  const WidgetA({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint('----------WidgetA build------');
    return const Center(
      child: Text(
        '点击的次数',
      ),
    );
  }
}




class WidgetB extends StatelessWidget {
  const WidgetB({super.key});
  @override
  Widget build(BuildContext context) {
    // 6.子组件通过父组件的of方法访问父组件state里面的数据。
    final TestPageState state = TestPage.of(
      context,
    );
    debugPrint('----------WidgetB build------');
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: Text(
        '${state.counter}',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({super.key});
  @override
  Widget build(BuildContext context) {
    // 4.子组件通过of方法访问父组件state里面的数据。
    final TestPageState state = TestPage.of(context);
    debugPrint('----------WidgetC build------');
    return TextButton(
      onPressed: () {
        state.incrementPageCounter();
      },
      child: const Icon(Icons.add),
    );
  }
}
