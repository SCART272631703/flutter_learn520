// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//           primarySwatch: Colors.blue, splashColor: Colors.transparent),
//       home: const HYBatteryScreen(),
//     );
//   }
// }

// class HYBatteryScreen extends StatefulWidget {
//   const HYBatteryScreen({super.key});
//   static const String routeName = "/battery";
//   @override
//   HYBatteryScreenState createState() => HYBatteryScreenState();
// }

// class HYBatteryScreenState extends State<HYBatteryScreen> {
//   // 核⼼代码⼀：
//   static const platform = MethodChannel("coderwhy.com/battery");
//   String result = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Battery"),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Text("当前电池信息: $result"),
//             TextButton(
//               onPressed: getBatteryInfo,
//               child: const Text("获取电池信息"),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   // void getBatteryInfo() async {
//   //   Future<String> infoFuture = await platform.invokeMethod('getBatteryInfo');
//   //   infoFuture.then((value) {
//   //     print('-------------  $value -----------------');
//   //     setState(() {
//   //       result = value.toString();
//   //     });
//   //   });
//   // }

//   void getBatteryInfo() async {
//     // 核⼼代码⼆
//     final String results = await platform.invokeMethod("getBatteryInfo");
//     setState(() {
//       result = results;
//     });
//   }
// }
