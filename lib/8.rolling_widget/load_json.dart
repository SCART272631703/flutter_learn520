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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1),
          itemCount: anchors.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Image.network(anchors[index].imageUrl),
                const SizedBox(height: 5),
                Text(
                  anchors[index].nickname,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  anchors[index].roomName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            );
          }),
    );
  }
}
