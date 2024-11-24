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
//         body: const HomeBody(),
//       ),
//     );
//   }
// }

// class HomeBody extends StatelessWidget {
//   const HomeBody({super.key});
//   @override
//   Widget build(BuildContext context) {
//     debugPrint("HomeBody build");
//     return  MyCounterWidget();
//   }
// }

// class MyCounterWidget extends StatefulWidget {
//    MyCounterWidget({super.key}) {
//     debugPrint("执⾏了MyCounterWidget的构造⽅法");
//   }

//   @override
//   State<StatefulWidget> createState() {
//     debugPrint("执⾏了MyCounterWidget的createState⽅法");
//     // 将创建的State返回
//     return MyCounterState();
//   }
// }

// class MyCounterState extends State<MyCounterWidget> {
//   int counter = 0;

//   MyCounterState() {
//     debugPrint("执⾏MyCounterState的构造⽅法");
//   }
//   @override
//   void initState() {
//     super.initState();
//     debugPrint("执⾏MyCounterState的init⽅法");
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     debugPrint("执⾏MyCounterState的didChangeDependencies⽅法");
//   }

//   @override
//   Widget build(BuildContext context) {
//     debugPrint("执⾏执⾏MyCounterState的build⽅法");
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextButton(
//                 // color: Colors.redAccent,
//                 style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.redAccent),),
//                 child: const Text(
//                   "+1",
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     counter++;
//                   });
//                 },
//               ),
//               TextButton(
//                 style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.orangeAccent),),
//                 child: const Text(
//                   "-1",
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     counter--;
//                   });
//                 },
//               )
//             ],
//           ),
//           Text(
//             "当前计数：$counter",
//             style: const TextStyle(fontSize: 30),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   void didUpdateWidget(MyCounterWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     debugPrint("执⾏MyCounterState的didUpdateWidget⽅法");
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     debugPrint("执⾏MyCounterState的dispose⽅法");
//   }
// }
