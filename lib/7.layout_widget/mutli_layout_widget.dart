// //2.1.2. Row演练
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
//     return Row(
// //1.MainAxisSize.max，表示尽可能多的占⽤⽔平⽅向的空间，此时⽆论⼦widgets实际占⽤多少⽔平空间，
// //Row的宽度始终等于⽔平⽅向的最⼤宽度.
// //2.MainAxisSize.min表示尽可能少的占⽤⽔平空间，当⼦widgets没有占满⽔平剩余空间，则Row的实际宽度
// //等于所有⼦widgets占⽤的的⽔平空间.
// //3.默认情况下，Row会尽可能占据多的宽度，让⼦Widget在其中进⾏排布，这是因为mainAxisSize属性默认值是
// //MainAxisSize.max
//       mainAxisSize: MainAxisSize.max,
// //4.如果mainAxisSize值为MainAxisSize.min，则此属性⽆意义，因为⼦widgets的宽度等于Row的宽度
// //只有当mainAxisSize的值为MainAxisSize.max时，此属性才有意义
// //5.MainAxisAlignment.start表示沿textDirection的初始⽅向对⻬，textDirection取值
// //为TextDirection.rtl时表示从右对⻬。
// //6.⽽MainAxisAlignment.end和MainAxisAlignment.start正好相反；
// //MainAxisAlignment.center表示居中对⻬。
//       textDirection: TextDirection.rtl,
//       mainAxisAlignment: MainAxisAlignment.start,
// //7.crossAxisAlignment：表示⼦Widgets在纵轴⽅向的对⻬⽅式,Row的⾼度等于⼦Widgets中最⾼的⼦元素⾼度
// //它的取值和MainAxisAlignment⼀样(包含start、end、center三个值)
// //不同的是crossAxisAlignment的参考系是verticalDirection，即verticalDirection值为
// //VerticalDirection.down时crossAxisAlignment.start指顶部对⻬，
// //verticalDirection值为VerticalDirection.up时，crossAxisAlignment.start指底部对⻬；⽽
// //crossAxisAlignment.end和crossAxisAlignment.start正好相反.
//       verticalDirection: VerticalDirection.up,
//       crossAxisAlignment: CrossAxisAlignment.start,

//       children: <Widget>[
//         Container(color: Colors.red, width: 60, height: 60),
//         Container(color: Colors.blue, width: 80, height: 80),
//         Container(color: Colors.green, width: 70, height: 70),
//         Container(color: Colors.orange, width: 100, height: 100),
//       ],
//     );
//   }
// }

//2.1.2. Row演练
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
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       mainAxisSize: MainAxisSize.max,
//       children: <Widget>[
// //如果我们希望红⾊和⻩⾊的Container Widget不要设置固定的宽度，⽽是占据剩余的部分，这个时候应该如何处理呢？
// //这个时候我们可以使⽤ Expanded 来包裹 Container Widget，并且将它的宽度不设置值；
// // flex属性，弹性系数，Row会根据两个Expanded的弹性系数来决定它们占据剩下空间的⽐例
//         Expanded( // expand 扩大，发展
//           flex: 1, // flex 弯曲，收缩
//           child: Container(color: Colors.red, height: 60),
//         ),
//         Container(color: Colors.blue, width: 80, height: 80),
//         Container(color: Colors.green, width: 70, height: 70),
//         Expanded(
//           flex: 1,
//           child: Container(color: Colors.orange, height: 100),
//         )
//       ],
//     );
//   }
// }
//2.2.2. Column演练
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
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Expanded(
//           flex: 1,
//           child: Container(color: Colors.red, width: 60),
//         ),
//         Container(color: Colors.blue, width: 80, height: 80),
//         Container(color: Colors.green, width: 70, height: 70),
//         Expanded(
//           flex: 1,
//           child: Container(color: Colors.orange, width: 100),
//         )
//       ],
//     );
//   }
// }
// 2.3.2. Stack演练
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
// //在开发中，我们多个组件很有可能需要重叠显示，⽐如在⼀张图⽚上显示⽂字或者⼀个按钮等。
//     return Stack(
// // 1.alignment：此参数决定如何去对⻬没有定位（没有使⽤Positioned）或部分定位的⼦widget。所谓部分定
// // 位，在这⾥特指没有在某⼀个轴上定位：left、right为横轴，top、bottom为纵轴，只要包含某个轴上的⼀个
// // 定位属性就算在该轴上有定位。
//       alignment: AlignmentDirectional.topStart,
// // 2.textDirection：和Row、Wrap的textDirection功能⼀样，都⽤于决定alignment对⻬的参考系即：
// // textDirection的值为TextDirection.ltr，则alignment的start代表左，end代表右；textDirection的值为
// // TextDirection.rtl，则alignment的start代表右，end代表左。
//       textDirection: TextDirection.rtl,
// // 3.loose,松动的，零散的，fit：此参数⽤于决定没有定位的⼦widget如何去适应Stack的⼤⼩。StackFit.loose表示使⽤⼦widget的⼤
// // ⼩，StackFit.expand表示扩伸到Stack的⼤⼩。

//       fit: StackFit.loose,
// // 4. overflow被clipBehavior代替，当clipBehavior值为clipBehavior: Clip.none时，超出部分不会被
// // 裁剪；当clipBehavior值为 Clip.hardEdge和Clip.antiAliasWithSaveLayer时，超出部分会被裁剪。
//       clipBehavior: Clip.none,

//       children: <Widget>[
//         Container(
//           color: Colors.purple,
//           width: 300,
//           height: 300,
//         ),
//         Positioned(
//           top: 100,
//           right: 70,
//           child: Container(
//             width: 100,
//             height: 100, 
//             child: Image.asset("assets/images/image1.jpeg",fit: BoxFit.fill,),
//           ),
//         ),
//         const Positioned(
//             right: -20,
//             top: 20,
//             child: Icon(Icons.favorite, size: 50, color: Colors.yellow)),
//         const Positioned(
//           bottom: 20,
//           right: 20,
//           child: Text("你好啊，黄蓉",
//               style: TextStyle(fontSize: 20, color: Colors.red)),
//         )
//       ],
//     );
//   }
// }
