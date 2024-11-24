//3.1.1. GridView构造函数 方式一：gridDelegate:SliverGridDelegateWithFixedCrossAxisCount
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
//         body: const MyGridCountDemo(),
//       ),
//     );
//   }
// }

// class MyGridCountDemo extends StatelessWidget {
//   const MyGridCountDemo({super.key});
//   List<Widget> getGridWidgets() {
//     return List.generate(100, (index) {
//       return Container(
//         color: Colors.purple,
//         alignment: const Alignment(0, 0),
//         child: Text("item$index",
//             style: const TextStyle(fontSize: 20, color: Colors.white)),
//       );
//     });
//   }
// // gridDelegate⽤于控制交叉轴的item数量或者宽度，需要传⼊的类型是SliverGridDelegate，
// // 但是它是⼀个抽象类，所以我们需要传⼊它的⼦类：SliverGridDelegateWithFixedCrossAxisCount
//   @override
//   Widget build(BuildContext context) {
//     return GridView(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,  // 交叉轴的item个数
//           mainAxisSpacing: 10, // 主轴的间距
//           crossAxisSpacing: 10, // 交叉轴的间距
//           childAspectRatio: 1.0), // ⼦Widget的宽⾼⽐
//       children: getGridWidgets(),
//     );
//   }
// }
// //3.1.2. GridView构造函数 方式二：gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent
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
//         body: const MyGridCountDemo(),
//       ),
//     );
//   }
// }

// class MyGridCountDemo extends StatelessWidget {
//   const MyGridCountDemo({super.key});
//   List<Widget> getGridWidgets() {
//     return List.generate(100, (index) {
//       return Container(
//         color: Colors.purple,
//         alignment: const Alignment(0, 0),
//         child: Text("item$index",
//             style: const TextStyle(fontSize: 20, color: Colors.white)),
//       );
//     });
//   }

// // gridDelegate⽤于控制交叉轴的item数量或者宽度，需要传⼊的类型是SliverGridDelegate，
// // 但是它是⼀个抽象类，所以我们需要传⼊它的⼦类：SliverGridDelegateWithFixedCrossAxisCount
//   @override
//   Widget build(BuildContext context) {
//     return GridView(
//       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: 200.0, // 交叉轴的item宽度
//         mainAxisSpacing: 10.0, // 主轴的间距
//         crossAxisSpacing: 10.0, // 交叉轴的间距
//         childAspectRatio: 1.0, // ⼦Widget的宽⾼⽐
//       ),
//       children: getGridWidgets(),
//     );
//   }
// }

// 3.1.3. GridView.count构造函数
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
//         body: const MyGridCountDemo(),
//       ),
//     );
//   }
// }

// class MyGridCountDemo extends StatelessWidget {
//   const MyGridCountDemo({super.key});
//   List<Widget> getGridWidgets() {
//     return List.generate(100, (index) {
//       return Container(
//         color: Colors.purple,
//         alignment: const Alignment(0, 0),
//         child: Text("item$index",
//             style: const TextStyle(fontSize: 20, color: Colors.white)),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 3,  // 交叉轴的item个数
//       mainAxisSpacing: 10, // 主轴的间距
//       crossAxisSpacing: 10,  // 交叉轴的间距
//       childAspectRatio: 1.0, // ⼦Widget的宽⾼⽐
//       children:getGridWidgets(),
//     );
//   }
// }

// // 3.1.4. GridView.extent 构造函数
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
//         body: const MyGridCountDemo(),
//       ),
//     );
//   }
// }

// class MyGridCountDemo extends StatelessWidget {
//   const MyGridCountDemo({super.key});
//   List<Widget> getGridWidgets() {
//     return List.generate(100, (index) {
//       return Container(
//         color: Colors.purple,
//         alignment: const Alignment(0, 0),
//         child: Text("item$index",
//             style: const TextStyle(fontSize: 20, color: Colors.white)),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GridView.extent(
//       maxCrossAxisExtent: 200,  // 交叉轴item的宽度
//       mainAxisSpacing: 10, // 主轴的间距
//       crossAxisSpacing: 10,  // 交叉轴的间距
//       childAspectRatio: 1.0, // ⼦Widget的宽⾼⽐
//       children:getGridWidgets(),
//     );
//   }
// }

// 3.2. GridView.build
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

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
        body: const GridViewBuildDemo(),
      ),
    );
  }
}

class GridViewBuildDemo extends StatefulWidget {
  const GridViewBuildDemo({super.key});
  @override
  State<StatefulWidget> createState() {
    return GridViewBuildDemoState();
  }
}

class Anchor {
  String nickname;
  String roomName;
  String imageUrl;

  Anchor(this.nickname, this.roomName, this.imageUrl);

  Anchor.fromMap(Map<String, dynamic> parsedMap)
      : this(parsedMap["nickname"], parsedMap["roomName"],
            parsedMap["imageUrl"]);
}

Future<List<Anchor>> getAnchors() async {
  // 1.读取json⽂件
  String jsonString = await rootBundle.loadString("assets/jsons/anchor.json");
  // 2.转成List或Map类型
  final jsonResult = json.decode(jsonString);
  // debugPrint("---------------$jsonResult---------------");
  // 3.遍历List，并且转成Anchor对象放到另⼀个List中
  var anchors = (jsonResult['data'] as List<dynamic>).map((item) {
    return Anchor.fromMap(item);
  }).toList();
  return anchors;
}

class GridViewBuildDemoState extends State<GridViewBuildDemo> {
  // GridViewBuildDemoState({super.key});
  List<Anchor> anchors = [];
  @override
  void initState() {
    getAnchors().then((anchors) {
      setState(() {
        this.anchors = anchors;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          shrinkWrap: true, //  shrinkWrap 收缩性薄膜
          physics:
              const ClampingScrollPhysics(), // ClampingScrollPhysics 夹紧滚动物理学
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1),
          itemCount: anchors.length,
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                Image.network(
                  anchors[index].imageUrl,
                  width: 165,
                  height: 165,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 5),
                Text(
                  anchors[index].nickname,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  anchors[index].roomName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            );
          }),
    );
  }
}
