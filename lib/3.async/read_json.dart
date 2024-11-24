// import 'dart:convert';
// import 'dart:async';
// import 'package:flutter/services.dart' show rootBundle;

// class Anchor {
//   late String nickname;
//   late String roomName;
//   late String imageUrl;

//   Anchor(nickname, roomName, imageUrl);
//   Anchor.withMap(Map<String, dynamic> parsedMap)
//       : this(
//             parsedMap["nickname"], parsedMap["roomName"], parsedMap["roomSrc"]);
// }

// Future<List<Anchor>> getAnchors() async {
//   // 1.读取json⽂件
//   String jsonString = await rootBundle.loadString("assets/jsons/yz.json");
//   // 2.转成List或Map类型
//   final jsonResult = json.decode(jsonString);
//   // 3.遍历List，并且转成Anchor对象放到另⼀个List中
//   var anchors = (jsonResult['data'] as List<dynamic>).map((item){
//     return Anchor.withMap(item);
//   }).toList();

//   return anchors;
// }

// main(List<String> args) {
//   getAnchors().then((anchors) {
//     print(anchors);
//   });
// }
