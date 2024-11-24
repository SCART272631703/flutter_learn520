// 在Flutter开发中，我们可以通过定义 Theme，复⽤颜⾊和字体样式，从⽽让整个app的设计看起来更⼀致。
// ⼀. Theme主题的使⽤
// Theme分为：全局Theme和局部Theme
// 主题有两个作⽤：
// • 设置了主题之后，某些Widget会⾃动使⽤主题的样式（⽐如AppBar的颜⾊）
// • 将某些样式放到主题中统⼀管理，在应⽤程序的其它地
// ⽅直接引⽤
// 1.1. 全局Theme
// 全局Theme会影响整个app的颜⾊和字体样式。
// 使⽤起来⾮常简单，只需要向MaterialApp构造器传⼊ThemeData 即可。
// • 如果没有设置Theme，Flutter将会使⽤预设的样式。
// • 当然，我们可以对它进⾏定制

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // 1.亮度: light-dark
          brightness: Brightness.light,
          // 2.primarySwatch: primaryColor/accentColor的结合体
          primarySwatch: Colors.red,
          // 3.主要颜⾊: 导航/底部TabBar
          primaryColor: Colors.green,
          // 4.次要颜⾊: FloatingActionButton/按钮颜⾊
          // accentColor: Colors.orange,
          secondaryHeaderColor: Colors.orange,
          // 5.卡⽚主题
          cardTheme: CardTheme(
              color: Colors.greenAccent,
              elevation: 10,
              shape: Border.all(width: 3, color: Colors.red),
              margin: const EdgeInsets.all(10)),
          // 6.按钮主题
          buttonTheme: const ButtonThemeData(minWidth: 0, height: 25),
          // 7.⽂本主题
          textTheme: const TextTheme(
            titleMedium: TextStyle(fontSize: 30, color: Colors.blue),
            displayMedium: TextStyle(fontSize: 10),
          )),
      home: const MyHomePage(title: 'jdsjgkds'),
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
  ListItemFulState createState() => ListItemFulState();
}

class ListItemFulState extends State<ListItemFul> {
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

// 1.2. 局部Theme
// 如果某个具体的Widget不希望直接使⽤全局的Theme，⽽希望⾃⼰来定义，应该如何做呢？
// • ⾮常简单，只需要在Widget的⽗节点包裹⼀下Theme即可
// 创建另外⼀个新的⻚⾯，⻚⾯中使⽤新的主题：
// • 在新的⻚⾯的Scaffold外，包裹了⼀个Theme，并且设置data为⼀个新的ThemeData

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

// 1.2.1. 但是，我们很多时候并不是想完全使⽤⼀个新的主题，⽽且在之前的主题基础之上进⾏修改：
class HYThreedPage extends StatelessWidget {
  const HYThreedPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.greenAccent),
      // 在使用原有主题基础上，修改primaryColor为Colors.greenAccent
      child: const Scaffold(),
    );
  }
}

// 1.2.2. 但是这⾥有⼀个注意事项：accentColor在这⾥并不会被覆盖。
// 为什么不能覆盖呢？https://github.com/materialcomponents/material-components-flutter-codelabs/issues/106