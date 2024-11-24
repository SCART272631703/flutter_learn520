//TextWidget
// import 'package:flutter/material.dart';

// main(List<String> args) {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("HelloWorld"),
//         ),
//         body: const MyHomeBody(),
//       ),
//     );
//   }
// }

// class MyHomeBody extends StatelessWidget {
//   const MyHomeBody({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Text(
//       "《定⻛波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐⾏。\n⽵杖芒鞋轻胜⻢，谁怕？⼀蓑烟⾬任平⽣。",
//       textAlign: TextAlign.center, // 所有内容都居中对⻬
//       maxLines: 3, // 显然 "⽣。" 被删除了
//       overflow: TextOverflow.ellipsis, // 超出部分显示...
// // textScaleFactor: 1.25,
//       style: TextStyle(fontSize: 20, color: Colors.purple),
//     );
//   }
// }

//RichText
// import 'package:flutter/material.dart';

// main(List<String> args) {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("HelloWorld"),
//         ),
//         body: const MyHomeBody(),
//       ),
//     );
//   }
// }

// class MyHomeBody extends StatelessWidget {
//   const MyHomeBody({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child:  Text.rich(
//       TextSpan(//span 持续时间
//         children: [
//           TextSpan(
//               text: "《定⻛波》",
//               style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black)),
//           TextSpan(
//               text: "苏轼",
//               style: TextStyle(fontSize: 18, color: Colors.redAccent)),
//           TextSpan(text: "\n莫听穿林打叶声，何妨吟啸且徐⾏。\n⽵杖芒鞋轻胜⻢，谁怕？⼀蓑烟⾬任平⽣。")
//         ],
//       ),
//       style: TextStyle(fontSize: 20, color: Colors.purple),
//       textAlign: TextAlign.center,
//     ));
//   }
// }
