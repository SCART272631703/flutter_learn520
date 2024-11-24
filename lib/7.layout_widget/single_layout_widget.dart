// //1.1.2. Align演练
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
//     return const Align(
//       alignment: Alignment.bottomRight,
//       widthFactor: 3,// widthFactor设置为3，那么相对于Align的宽度是⼦组件跨度的3倍；
//       heightFactor: 3,// widthFactor不设置的话，那么默认Align会尽可能的⼤（尽可能占据⾃⼰所在的⽗组件
//       child: Icon(Icons.pets, size: 36, color: Colors.red),
//     );
//   }
// }

//1.2.2. Center演练
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
//     return const Center(// 事实上Center组件继承⾃Align，只是将alignment设置为Alignment.center
//       widthFactor: 3,
//       heightFactor: 3,
//       child: Icon(Icons.pets, size: 36, color: Colors.red),
//     );
//   }
// }

// //1.3.2. Padding演练
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
//     return const Padding(// Padding通常⽤于设置⼦Widget到⽗Widget的边距
//         padding: EdgeInsets.all(20),// 你可以称之为是⽗组件的内边距或⼦Widget的外边距
//         child: Text(
//           "莫听穿林打叶声，何妨吟啸且徐⾏。⽵杖芒鞋轻胜⻢，谁怕？⼀蓑烟⾬任平⽣。",
//           style: TextStyle(color: Colors.redAccent, fontSize: 18),
//         ));
//   }
// }

// //1.4.2. Container演练
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
//         // color和decoration是互斥的，实际上，当指定color时，Container内会⾃动创建⼀个decoration
//         color: const Color.fromRGBO(3, 3, 255, .5),
//         width: 100, // 容器的⼤⼩可以通过width、height属性来指定，也可以通过constraints来指定，
//         // 如果同时存在时，width、height优先,实际上Container内部会根据width、height来⽣成⼀个constraints
//         height: 100,
//         child: const Icon(Icons.pets, size: 32, color: Colors.white),
//       ),
//     );
//   }
// }
//1.4.3. BoxDecoration
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
//                                             // color: Color.fromRGBO(3, 3, 255, .5),
//         width: 150,
//         height: 150,
//         decoration: BoxDecoration(
//             color: Colors.amber, // 背景颜⾊
//             // border: Border(top: BorderSide(color: Colors.redAccent)),
//             border: Border.all(
//                 color: Colors.redAccent,
//                 width: 3,
//                 style: BorderStyle.solid), // 这⾥也可以使⽤Border.all统⼀设置
//                                           // top: BorderSide(
//                                           // color: Colors.redAccent,
//                                           // width: 3,
//                                           // style: BorderStyle.solid
//                                           // ),
//             borderRadius: BorderRadius.circular(20), // 这⾥也可以使⽤.only分别设置
//             boxShadow: const [
//               BoxShadow(
//                   offset: Offset(5, 5), color: Colors.purple, blurRadius: 5)
//             ],
//                                           // shape: BoxShape.circle, // 会和borderRadius冲突
//             gradient: const LinearGradient(colors: [Colors.green, Colors.red])),
//         child: const Icon(Icons.pets, size: 32, color: Colors.white),
//       ),
//     );
//   }
// }
//1.4.4. 实现圆⻆图像
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("HelloWorld"),
        ),
        body: const HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: NetworkImage(
                  "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"),
            )),
      ),
    );
  }
}
