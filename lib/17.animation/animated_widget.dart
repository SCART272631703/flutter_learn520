// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
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
//       home: HYHomePage(),
//     );
//   }
// }

// class HYHomePage extends StatelessWidget {
//   HYHomePage({super.key});
//   final GlobalKey<AnimationDemo01State> demo01Key = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("动画测试"),
//       ),
//       body: AnimationDemo01(key: demo01Key),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.play_circle_filled),
//         onPressed: () {
//           var currentState = demo01Key.currentState;
//           if (currentState == null) return;
//           if (!currentState.controller.isAnimating) {
//             currentState.controller.forward();
//           } else {
//             currentState.controller.stop();
//           }
//         },
//       ),
//     );
//   }
// }

// class AnimationDemo01 extends StatefulWidget {
//   const AnimationDemo01({super.key});
//   @override
//   AnimationDemo01State createState() => AnimationDemo01State();
// }

// class AnimationDemo01State extends State<AnimationDemo01>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> animation;
//   @override
//   void initState() {
//     super.initState();
//     // 1.创建AnimationController
//     controller =
//         AnimationController(duration: const Duration(seconds: 1), vsync: this);
//     // 2.动画添加Curve效果
//     animation = CurvedAnimation(
//         parent: controller,
//         curve: Curves.elasticInOut,
//         reverseCurve: Curves.easeOut);
//     // 3.监听动画
//     // 4.控制动画的翻转
//     animation.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         controller.reverse();
//       } else if (status == AnimationStatus.dismissed) {
//         controller.forward();
//       }
//     });
//     // 5.设置值的范围
//     animation = Tween(begin: 50.0, end: 120.0).animate(controller);
//   }

//   @override
//   Widget build(BuildContext context) {
//     debugPrint('---------------- AnimationDemo01 build -----------------');
//     return Center(
//       child: IconAnimation(
//         animation: animation,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }

// class IconAnimation extends AnimatedWidget {
//   const IconAnimation({super.key, required Animation<double> animation})
//       : super(listenable: animation);
//   @override
//   Widget build(BuildContext context) {
//     debugPrint('---------------- IconAnimation build -----------------');
//     final animation = listenable as Animation<double>;
//     return Icon(
//       Icons.favorite,
//       color: Colors.red,
//       size: animation.value,
//     );
//   }
// }
