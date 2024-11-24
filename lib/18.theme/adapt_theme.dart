
import 'package:flutter/material.dart';
import 'dart:math';

// 2.2. 开发中适配
// 在开发中，为了能适配两种主题（设置是更多的主题），我们可以封装⼀个AppTheme
// • 1.公共的样式抽取成常量
// • 2.封装⼀个亮⾊主题
// • 3.封装⼀个暗⿊主题

void main() => runApp(const MyApp());

class AppTheme {
  // 1.抽取相同的样式
  static const double _titleFontSize = 20;

  // 2.亮⾊主题
  static final ThemeData lightTheme = ThemeData(
  // Swatch 样本，样品
      primarySwatch: Colors.pink,
      primaryTextTheme: const TextTheme(
          titleMedium:
              TextStyle(color: Colors.yellow, fontSize: _titleFontSize)),
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.red)));

  // 3.暗⿊主题
  static final ThemeData darkTheme = ThemeData(
      primaryColor: Colors.grey,
      primaryTextTheme: const TextTheme(
          titleMedium:
              TextStyle(color: Colors.white, fontSize: _titleFontSize)),
      textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const MyHomePage(title: '身份是老大发'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<MyHomePage> {
  List<String> names = [
    "石洞福克斯的快捷看老大数据看雷公",
    "对方身份多少工时大姐过来看石洞",
    "房东数据发了快递数据来看个酒店是快乐就够了石洞"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Key"),
      ),
      body: ListView(
        children: names.map((name) {
          return ListItemFul(
            name,
            key: ValueKey(name),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.delete),
          onPressed: () {
            setState(() {
              names.removeAt(0);
            });
          }),
    );
  }
}

class ListItemFul extends StatefulWidget {
  final String name;
  const ListItemFul(this.name, {super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ListItemFulState createState() => _ListItemFulState();
}

class _ListItemFulState extends State<ListItemFul> {
  final Color randomColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: randomColor,
      child: Text(widget.name),
    );
  }
}

class HYSecondPage extends StatelessWidget {
  const HYSecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: const Scaffold(),
    );
  }
}
