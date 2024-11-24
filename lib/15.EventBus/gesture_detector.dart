//2.1. 指针事件Pointer
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("⼿势测试"),
      ),
      body: GestureDetector(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
          onTap: () {},
          onTapDown: (detail) {
            debugPrint('${detail.globalPosition}');
            debugPrint('${detail.localPosition}');
          },
          onTapUp: (detail) {
            debugPrint('${detail.globalPosition}');
            debugPrint('${detail.localPosition}');
          }),
    );
  }
}
