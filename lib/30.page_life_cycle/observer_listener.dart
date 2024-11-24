// // 在Flutter中，可以使用WidgetsBindingObserver来监听页面的paused和resumed状态。你需要把你的
// // WidgetsBindingObserver实例注册到WidgetsBinding，这样就可以接收到各种生命周期事件。
// // 以下是一个简单的例子：
// // 1. Flutter SDK 3.13 之前的⽅式: with WidgetsBindingObserver
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
   const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
        print('App is in paused state');
        break;
      case AppLifecycleState.resumed:
        print('App is in resumed state');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}

// 在这个例子中，HomePageState类通过with WidgetsBindingObserver mixin了WidgetsBindingObserver。
// 这样它就可以覆盖didChangeAppLifecycleState方法来响应页面生命周期的变化。当页面被paused时，
// 会打印出App is in paused state，当页面恢复（resumed）时，会打印出App is in resumed state。
// 记得在initState方法中注册观察者，在dispose方法中注销观察者。

// 2.Flutter SDK 3.13 之后的⽅式：AppLifecycleListener

// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//   @override
//   HomePageState createState() => HomePageState();
// }

// class HomePageState extends State<HomePage> {
//   late final AppLifecycleListener _listener;
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the AppLifecycleListener class and passcallbacks
//     _listener = AppLifecycleListener(
//       onStateChange: _onStateChanged,
//     );
//   }

//   @override
//   void dispose() {
//     // Do not forget to dispose the listener
//     _listener.dispose();
//     super.dispose();
//   }

//   // Listen to the app lifecycle state changes
//   void _onStateChanged(AppLifecycleState state) {
//     switch (state) {
//       case AppLifecycleState.detached:
//         print('detached');
//       case AppLifecycleState.resumed:
//         print('resumed');
//       case AppLifecycleState.inactive:
//         print('inactive');
//       case AppLifecycleState.hidden:
//         print('hidden');
//       case AppLifecycleState.paused:
//         print('paused');
//     }
//   }

//   @override
//   void deactivate() {
//     // TODO: implement deactivate
//     super.deactivate();
//     print('在组件被移除节点后会被调⽤');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('Home Page'),
//       ),
//     );
//   }
// }
