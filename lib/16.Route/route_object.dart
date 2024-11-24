// //3.给Scaffold包裹⼀个PopScope
// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     const MyApp(),
//   );
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

// class HYHomePage extends StatefulWidget {
//   const HYHomePage({super.key});
//   @override
//   State<StatefulWidget> createState() {
//     return _HYHomePageState();
//   }
// }

// class _HYHomePageState extends State<HYHomePage> {
//   late String _message;
//   @override
//   void initState() {
//     _message = 'No message';
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     debugPrint('------ HYHomePage Widget build -------');
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("首页"),
//         ),
//         body: Center(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_message),
//             const SizedBox(
//               height: 10,
//             ),
//             TextButton(
//               onPressed: () {
//                 Future res = Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (ctx) {
//                   return const DetailPage("a home message");
//                 }));
//                 // 2.获取结果
//                 res.then((res) {
//                   setState(() {
//                     debugPrint('------------HYHomePage _onPushTap------------');
//                     _message = res.toString();
//                   });
//                 });
//               },
//               child: const Text("打开详情⻚"),
//             )
//           ],
//         )));
//   }
// }

// class DetailPage extends StatelessWidget {
//   final String _message;
//   const DetailPage(this._message, {super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("详情⻚"),
//         ),
// //  1.当 canPop 为 true，则系统返回手势将导致封闭的 Navigator 照常接收弹出，不会拦截;
// //  会调用 onPopInvoked，此时didPop为true。
// //  2.当 canPop 为 false，则系统返回手势不会将路由从封闭的 Navigator 中弹出，会拦截；
// //  但仍然会调用 onPopInvoked 方法，此时 didPop 为 false，
// //  此时进行逻辑判断或者插入其他需要执行的代码，如果需要返回则再执行 Navigator.of(context).pop(); 。
// // 3.注意此时 onPopInvoked 又会被再次调用，但此时 didPop 为 true。
// // 4.在onPopInvoked中，需要判断一下 didPop，如果为 true, 则 return。
//         body: PopScope(
//             // scope 范围，眼界，见识
//             canPop: false,
//             onPopInvoked: (didPop) {
//               if (didPop) {
//                 return;
//               }
//               Navigator.of(context).pop('123');
//             },
//             child: Center(
//                 child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(_message),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TextButton(
//                   onPressed: () => _onBackTap(context),
//                   child: const Text("返回首页"),
//                 ),
//               ],
//             ))));
//   }

//   // 按钮点击执⾏的代码
//   _onBackTap(BuildContext context) {
//     Navigator.of(context).pop("a detail message");
//   }
// }





























// //2.修改修改Scaffold的appBar为返回按钮
// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     const MyApp(),
//   );
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

// class HYHomePage extends StatefulWidget {
//   const HYHomePage({super.key});
//   @override
//   State<StatefulWidget> createState() {
//     return _HYHomePageState();
//   }
// }

// class _HYHomePageState extends State<HYHomePage> {
//   late String _message;
//   @override
//   void initState() {
//     _message = 'No message';
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     debugPrint('------ HYHomePage Widget build -------');
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("首页"),
//         ),
//         body: Center(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_message),
//             const SizedBox(
//               height: 10,
//             ),
//             TextButton(
//               onPressed: () => _onPushTap(context),
//               child: const Text("打开详情⻚"),
//             )
//           ],
//         )));
//   }

//   void _onPushTap(BuildContext context) {
//     Future future = Navigator.of(context)
//         .push(MaterialPageRoute(builder: (BuildContext context) {
//       return const DetailPage('首页来了');
//     }));
//     future.then((result) {
//       setState(() {
//         _message = result.toString();
//       });
//     });
//   }
// }

// class DetailPage extends StatelessWidget {
//   final String _message;
//   const DetailPage(this._message, {super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: const Text("详情⻚"),
//             leading: IconButton(
//                 icon: const Icon(Icons.arrow_back_sharp),
//                 onPressed: () => _onBackTap(context))
//             // leading 主要的，首位的
//             ),
//         body: Center(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_message),
//             const SizedBox(
//               height: 10,
//             ),
//             TextButton(
//                 onPressed: () => _onBackTap(context), child: const Text('返回按钮'))
//           ],
//         )));
//   }

//   // 按钮点击执⾏的代码
//   void _onBackTap(BuildContext context) {
//     Navigator.of(context).pop('second 页面 返回了');
//   }
// }






































// // 1.带参数的路由跳转
// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     const MyApp(),
//   );
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

// class HYHomePage extends StatefulWidget {
//   const HYHomePage({super.key});
//   @override
//   State<StatefulWidget> createState() {
//     return _HYHomePageState();
//   }
// }

// class _HYHomePageState extends State<HYHomePage> {
//   late String _message;
//   @override
//   void initState() {
//     _message = 'No message';
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     debugPrint('------ HYHomePage Widget build -------');
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("首页"),
//         ),
//         body: Center(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_message),
//             SizedBox(
//                 height: 50,
//                 child: TextButton(
//                   onPressed: () => _onPushTap(context),
//                   child: const Text("打开详情⻚"),
//                 )),
//           ],
//         )));
//   }

//   // 按钮点击执⾏的代码
//   _onPushTap(BuildContext context) {
//     // 1.跳转代码
//     final future = Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
//       return const DetailPage("a home message");
//     }));
//     // 2.获取结果
//     future.then((res) {
//       setState(() {
//         _message = res.toString();
//       });
//     });
//   }
// }

// class DetailPage extends StatelessWidget {
//   final String _message;
//   const DetailPage(this._message, {super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("详情页"),
//         ),
//         body: Center(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_message),
//             SizedBox(
//                 height: 50,
//                 child: TextButton(
//                   onPressed: () => _onBackTap(context),
//                   child: const Text("返回首页"),
//                 ))
//           ],
//         )));
//   }

//   // 按钮点击执⾏的代码
//   _onBackTap(BuildContext context) {
//     Navigator.of(context).pop(13);
//   }
// }
