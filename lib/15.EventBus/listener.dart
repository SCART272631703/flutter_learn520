//2.1. 指针事件Pointer
import 'package:flutter/material.dart';


// 在指针落下时，框架做了⼀个 hit test 的操作，确定与屏幕发⽣接触的位置上有哪些Widget以及分发给最内
// 部的组件去响应；事件会沿着最内部的组件向组件树的根冒泡分发；并且不存在⽤于取消或者停⽌指针事件进⼀步分发的机制；
// 原始指针事件使⽤Listener来监听
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Listener(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
        onPointerDown: (event) => debugPrint("⼿指按下:$event"),
        onPointerMove: (event) => debugPrint("⼿指移动:$event"),
        onPointerUp: (event) => debugPrint("⼿指抬起:$event"),
      ),
    );
  }
}
