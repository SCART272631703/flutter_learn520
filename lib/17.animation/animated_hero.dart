// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//           primarySwatch: Colors.blue, splashColor: Colors.transparent),
//       home: HYHomePage(),
//     );
//   }
// }

// class HYHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hero动画"),
//       ),
//       body: HYHomeContent(),
//     );
//   }
// }

// class HYHomeContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GridView(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 8,
//           mainAxisSpacing: 8,
//           childAspectRatio: 2),
//       children: List.generate(20, (index) {
//         String imageURL = "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png";
//         return GestureDetector(
//           onTap: () {
//             Navigator.of(context).push(
//                 PageRouteBuilder(pageBuilder: (ctx, animation, animation2) {
//               return FadeTransition(
//                 opacity: animation,
//                 child: HYImageDetail(imageURL),
//               );
//             }));
//           },
//           child: Hero(tag: imageURL, child: Image.network(imageURL)),
//         );
//       }),
//     );
//   }
// }

// class HYImageDetail extends StatelessWidget {
//   final String imageURL;
//   HYImageDetail(this.imageURL);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: GestureDetector(
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//             child: Hero(
//               tag: imageURL,
//               child: Image.network(
//                 this.imageURL,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             )),
//       ),
//     );
//   }
// }
