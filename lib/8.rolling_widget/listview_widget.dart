//2.1.1 ListView基本使⽤
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
//   final TextStyle textStyle =
//       const TextStyle(fontSize: 20, color: Colors.redAccent);
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         // Container(
//         //   height: 8,
//         //   width: 8,
//         //   child: Text("⼈的⼀切痛苦，本质上都是对⾃⼰⽆能的愤怒。", style: textStyle),
//         // ),
//         // const SizedBox(height: 8,width: 8,),
//         Text("⼈的⼀切痛苦，本质上都是对⾃⼰⽆能的愤怒。", style: textStyle),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text("⼈的⼀切痛苦，本质上都是对⾃⼰⽆能的愤怒。", style: textStyle),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child:
//               Text("⼈活在世界上，不可以有偏差；⽽且多少要费点劲⼉，才能把⾃⼰保持到理性的轨道上。", style: textStyle),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text("我活在世上，⽆⾮想要明⽩些道理，遇⻅些有趣的事。", style: textStyle),
//         )
//       ],
//     );
//   }
// }
//2.2.2. ListTile的使⽤

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
//     return ListView(
//       children: const <Widget>[
//         ListTile(
//           leading: Icon(
//             Icons.people,
//             size: 36,
//           ),
//           title: Text("联系⼈"),
//           subtitle: Text("联系⼈信息"),
//           trailing: Icon(Icons.arrow_forward_ios),
//         ),
//         ListTile(
//           leading: Icon(
//             Icons.email,
//             size: 36,
//           ),
//           title: Text("邮箱"),
//           subtitle: Text("邮箱地址信息"),
//           trailing: Icon(Icons.arrow_forward_ios),
//         ),
//         ListTile(
//           leading: Icon(
//             Icons.message,
//             size: 36,
//           ),
//           title: Text("消息"),
//           subtitle: Text("消息详情信息"),
//           trailing: Icon(Icons.arrow_forward_ios),
//         ),
//         ListTile(
//           leading: Icon(
//             Icons.map,
//             size: 36,
//           ),
//           title: Text("地址"),
//           subtitle: Text("地址详情信息"),
//           trailing: Icon(Icons.arrow_forward_ios),
//         )
//       ],
//     );
//   }
// }








// 2.2.3. 垂直/水平⽅向滚动
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
//         body:MyHomeBody(),
//       ),
//     );
//   }
// }

// class MyHomeBody extends StatelessWidget {
//  const MyHomeBody({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       // scrollDirection: Axis.horizontal,
//       // 这⾥需要注意，我们需要给ListView设置⼀个itemExtent，该属性会设置滚动⽅向上每个item所占据的宽度
//       // 否则它是没有宽度的，就不能正常显示
//       itemExtent: 200,
//       children: <Widget>[
//         Container(color: Colors.red,),
//         Container(color: Colors.green),
//         Container(color: Colors.blue),
//         Container(color: Colors.purple),
//         Container(color: Colors.orange),
//         Container(color: Colors.purple),
//         Container(color: Colors.orange),
//       ],
//     );
//   }
// }
//2.2. ListView.build
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
//         body: MyHomeBody(),
//       ),
//     );
//   }
// }
// // 通过构造函数中的children传⼊所有的⼦Widget有⼀个问题：默认会创建出所有的⼦Widget。但是对于⽤户来说，
// // ⼀次性构建出所有的Widget并不会有什么差异，但是对于我们的程序来说会产⽣性能问题，⽽且会增加⾸屏的渲染时间。

// // 我们可以ListView.build来构建⼦Widget，该构造函数将创建⼦Widget交给了⼀个抽象的⽅法，交给ListView进⾏
// // 管理，ListView会在真正需要的时候去创建⼦Widget，⽽不是⼀开始就全部初始化好。该⽅法有两个重要参数：
// // • itemBuilder：列表项创建的⽅法。当列表滚动到对应位置的时候，ListView会⾃动调⽤该⽅法来创建对应的⼦
// // Widget。类型是IndexedWidgetBuilder，是⼀个函数类型。
// // • itemCount：表示列表项的数量，如果为空，则表示ListView为⽆限列表。
// class MyHomeBody extends StatelessWidget {
//   const MyHomeBody({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: 100,
//         itemExtent: 80,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//               title: Text("标题$index"), subtitle: Text("详情内容$index"));
//         });
//   }
// }








//2.2.2. ListView.build动态数据
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
        body: const MyHomeBody(),
      ),
    );
  }
}

class MyHomeBody extends StatefulWidget {
  const MyHomeBody({super.key});
  @override
  State<StatefulWidget> createState() {
    return MyHomeBodyState();
  }
}

class Anchor {
  String nickname;
  String roomName;
  String imageUrl;

  Anchor(this.nickname, this.roomName, this.imageUrl);

  Anchor.fromMap(Map<String, dynamic> parsedMap)
      : this(
            parsedMap["nickname"], parsedMap["roomName"], parsedMap["imageUrl"]);
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

class MyHomeBodyState extends State<MyHomeBody> {
  List<Anchor> anchors = [];
  // 在初始化状态的⽅法中加载数据
  @override
  void initState() {
    getAnchors().then((anchors) {
      setState(() {
        this.anchors = anchors;
        // debugPrint("---------------$anchors---------------");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: anchors.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                anchors[index].imageUrl,
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: 8),
              Text(
                anchors[index].nickname,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              Text(anchors[index].roomName)
            ],
          ),
        );
      },
    );
  }
}








//2.2.3. ListView.separated
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
// // ListView.separated可以⽣成列表项之间的分割器，它除了⽐ListView.builder
// // 多了⼀个separatorBuilder参数，该参数是⼀个分割器⽣成器。
// class MyHomeBody extends StatelessWidget {
//   const MyHomeBody({super.key});
//   final Divider blueColor = const Divider(color: Colors.blue);
//   final Divider redColor = const Divider(color: Colors.red);
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             leading: const Icon(Icons.people),
//             title: Text("联系⼈${index + 1}"),
//             subtitle: Text("联系⼈电话${index + 1}"),
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           return index % 2 == 0 ? redColor : blueColor;
//         },
//         itemCount: 100);
//   }
// }
