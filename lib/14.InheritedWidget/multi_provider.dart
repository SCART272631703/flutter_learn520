// 在开发中，我们需要共享的数据肯定不⽌⼀个，并且数据之间我们需要组织到⼀起，所以⼀个Provider必然是不够的。
// 我们在增加⼀个新的ChangeNotifier,如果在开发中我们有多个Provider需要提供应该怎么做呢？
// ⽅式⼀：多个Provider之间嵌套
// • 这样做有很⼤的弊端，如果嵌套层级过多不⽅便维护，扩展性也⽐较差, 使⽤MultiProvider

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(create: (ctx) => CounterProvider()),
//       ChangeNotifierProvider(create: (ctx) => UserProvider()),
//     ],
//     child: const MyApp(),
//   ));
// }

// class CounterProvider extends ChangeNotifier {
//   int _counter = 100;
//   int get counter {
//     return _counter;
//   }

//   set counter(int value) {
//     _counter = value;
//     notifyListeners();
//   }
// }

// class UserInfo {
//   String nickname;
//   int level;
//   UserInfo(this.nickname, this.level);
// }

// class UserProvider extends ChangeNotifier {
//   UserInfo _userInfo = UserInfo("why", 18);
//   set userInfo(UserInfo info) {
//     _userInfo = info;
//     notifyListeners();
//   }

//   UserInfo get userInfo {
//     return _userInfo;
//   }

//     void setNickName(String nickName) {
//     nickName = nickName;
//     notifyListeners();//通知所有监听的页面，如果写在runapp中那么通知所有页面重新加载
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const HYHomePage(),
//     );
//   }
// }

// class HYHomePage extends StatelessWidget {
//   const HYHomePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     debugPrint('------ HYHomePage Widget build -------');
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("列表测试"),
//         ),
//         body: Center(
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           SizedBox(
//             height: 50,
//             child: Consumer<CounterProvider>(builder: (ctx, counterPro, child) {
//               debugPrint('------ CounterProvider build -------');
//               return Text(
//                 "当前计数:${counterPro.counter}",
//                 style: const TextStyle(fontSize: 20, color: Colors.red),
//               );
//             }),
//           ),
//           SizedBox(
//             height: 50,
//             child: Consumer<UserProvider>(builder: (ctx, userPro, child) {
//               debugPrint('------ CounterProvider build -------');
//               return Text(
//                 "姓名:${userPro.userInfo.nickname}",
//                 style: const TextStyle(fontSize: 20, color: Colors.red),
//               );
//             }),
//           ),
//         ])),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => pushSecondPage(context),
//           child: const Icon(Icons.add),
//         ));
//   }

//   void pushSecondPage(BuildContext context) {
//     Navigator.of(context).push(MaterialPageRoute(
//         builder: (BuildContext context) => const SecondPage()));
//   }
// }

// class SecondPage extends StatelessWidget {
//   const SecondPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("第⼆个⻚⾯"),
//       ),
//       floatingActionButton: Consumer<CounterProvider>(
//         builder: (ctx, counterPro, child) {
//           return FloatingActionButton(
//             child: child,
//             onPressed: () {
//               counterPro.counter += 1;
//             },
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
