//1.1.网络图片和gif图片
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
//     return Center(
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,//axis 轴线
//       children: [
//         Container(
//           width: 300,
//           height: 300,
//           color: Colors.yellow,
//           child: Image.network(
//             "http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg",
//             alignment: Alignment.topCenter,
//             repeat: ImageRepeat.repeatY,
//             color: Colors.red,
//             colorBlendMode: BlendMode.colorDodge,
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         // 加载gif动画
//         Container(
//           width: 300,
//           height: 300,
//           color: Colors.yellow,
//           child: Image.network(
//             'https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true',
//             alignment: Alignment.topCenter,
//             repeat: ImageRepeat.repeatY,
//             color: Colors.red,
//             colorBlendMode: BlendMode.colorDodge,
//           ),
//         ),
//       ],
//     ));
//   }
// }

// 1.2.网络图片,FadeInImage 占位图片
// import 'package:flutter/material.dart';
// import 'package:transparent_image/transparent_image.dart';

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
//     return Center(
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           width: 300,
//           height: 200,
//           color: Colors.white,
//           child: Image.network(
//             "http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg",
//             alignment: Alignment.topCenter,
//             repeat: ImageRepeat.repeatY,
//             color: Colors.red,
//             colorBlendMode: BlendMode.colorDodge,
//           ),
//         ),

//         const SizedBox(
//           height: 10,
//         ),
//         // 占位图片
//         Container(
//           width: 300,
//           height: 200,
//           color: Colors.white,
//           child: FadeInImage.memoryNetwork(// fadein 渐明，渐显
//             placeholder: kTransparentImage,// transparent 透明的，易懂的
//             alignment: Alignment.topCenter,
//             repeat: ImageRepeat.repeatY,
//             color: Colors.red,
//             colorBlendMode: BlendMode.colorDodge,
//             image:
//                 'http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg',
//           ),
//         ),
//         // 占位图片
//       ],
//     ));
//   }
// }
// 1.3.ached_image_network支持缓存图片，支持在加载时还支持占位符和淡入淡出图
// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';

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
//     return Center(
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         // cached_image_network支持缓存图片，支持在加载时还支持占位符和淡入淡出图片
//         Container(
//           width: 300,
//           height: 300,
//           color: Colors.yellow,
//           child: CachedNetworkImage(
//             placeholder: (context, url) => const CircularProgressIndicator(),
//             errorWidget: (context, url, error) => const Icon(Icons.error),
//             imageUrl:
//                 'http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg',
//           ),
//         ),
//       ],
//     ));
//   }
// }

// 2.本地图片
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
//     return Center(
//       child: Container(
//         width: 300,
//         height: 300,
//         color: Colors.yellow,
//         child: Image.asset("assets/images/image1.jpeg"),
//       ),
//     );
//   }
// }
//3.1.实现圆⻆头像CircleAvatar
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
//         body: const HomeContent(),
//       ),
//     );
//   }
// }

// class HomeContent extends StatelessWidget {
//   const HomeContent({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: CircleAvatar(// avatar 化身
//         radius: 100,
//         backgroundImage: const NetworkImage(
//             "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"),
//         child: Container(
//             alignment: const Alignment(0, .5),
//             width: 200,
//             height: 200,
//             child: const Text("兵⻓利威尔")),
//       ),
//     );
//   }
// }
//3.2.实现圆⻆头像 ClipOval
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
//         body: const HomeContent(),
//       ),
//     );
//   }
// }

// class HomeContent extends StatelessWidget {
//   const HomeContent({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ClipOval(
//         child: Image.network(
//           "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
//           width: 200,
//           height: 200,
//         ),
//       ),
//     );
//   }
// }
//3.3.1.实现⽅式三：Container+BoxDecoration
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
//         body: const HomeContent(),
//       ),
//     );
//   }
// }

// class HomeContent extends StatelessWidget {
//   const HomeContent({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: 200,
//         height: 200,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             image: const DecorationImage(
//               image: NetworkImage(
//                   "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"),
//             )),
//       ),
//     );
//   }
// }
//3.3.2.实现圆⻆图⽚ ⽅式⼀：Container+BoxDecoration
//3.3.3.实现圆⻆图⽚ ⽅式二：ClipRRect

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
//         body: const HomeContent(),
//       ),
//     );
//   }
// }

// class HomeContent extends StatelessWidget {
//   const HomeContent({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: Image.network(
//           "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
//           width: 200,
//           height: 200,
//         ),
//       ),
//     );
//   }
// }
