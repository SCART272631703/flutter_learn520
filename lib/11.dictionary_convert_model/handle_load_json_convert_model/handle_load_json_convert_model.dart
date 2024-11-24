// class Person {
//   String ? name;
//   String ? avatarURL;
//   Person.fromMap(Map<String, dynamic> json) {
//     name = json["name"];
//     avatarURL = json["avatars"]["medium"];
//   }
// }

// class Actor extends Person {
//   Actor.fromMap(Map<String, dynamic> json) : super.fromMap(json);
// }

// class Director extends Person {
//   Director.fromMap(Map<String, dynamic> json) : super.fromMap(json);
// }

// int counter = 1;

// class MovieItem {
//   int ? rank;
//   String ? imageURL;
//   String ? title;
//   String ?  playDate;
//   double  ? rating;
//   List<String>  ?  genres;
//   List<Actor>  ? casts;
//   Director  ?  director;
//   String  ? originalTitle;
//   MovieItem.fromMap(Map<String, dynamic> json) {
//     rank = counter++;
//     imageURL = json["images"]["medium"];
//     title = json["title"];
//     playDate = json["year"];
//     rating = json["rating"]["average"];
//     genres = json["genres"].cast<String>();
//     casts = (json["casts"] as List<dynamic>).map((item) {
//       return Actor.fromMap(item);
//     }).toList();
//     director = Director.fromMap(json["directors"][0]);
//     originalTitle = json["original_title"];
//   }
// }
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'abc'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title})
      : assert(title == 'abc', 'title isnot abc');
  final String title;
  @override
  State<MyHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    getAnchors().then((anchors) {
      debugPrint(anchors.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Key"),
      ),
      body: const Center(
        child: Text("My text"),
      ),
    );
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
  // Anchor.fromMap(Map<String, dynamic> parsedMap) {
  //   nickname = parsedMap["nickname"];
  //   roomName = parsedMap["roomName"];
  //   imageUrl = parsedMap["roomSrc"];
  // }
}

Future<List<Anchor>> getAnchors() async {
  // 1.读取json⽂件
  String jsonString = await rootBundle.loadString("assets/jsons/anchor.json");
  // 2.转成List或Map类型
  final jsonResult = json.decode(jsonString);
  debugPrint('-----jsonResult:$jsonResult--------');
  // 3.遍历List，并且转成Anchor对象放到另⼀个List中
  // 这段代码有问题
//   List<Anchor> anchors =  List<dynamic>();
//   for (Map<String, dynamic> map in jsonResult) {
//   anchors.add(Anchor.withMap(map));
//  }
  // 这才是正确的代码
  // var anchors = (jsonResult['data'] as List<dynamic>).map((item) => Anchor.fromMap(item));
  var anchors = (jsonResult['data'] as List<dynamic>).map((item) {//Iterable 可迭代的
    return Anchor.fromMap(item);
  }).toList();
  debugPrint('-----anchors:$anchors--------');
  return anchors;
}
