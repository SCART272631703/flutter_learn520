import 'package:flutter/material.dart';
// 2.1. darkTheme
// ⽬前很多应⽤程序都需要适配暗⿊模式，Flutter中如何做到暗⿊模式的适配呢？
// 事实上，MaterialApp中有两个参数：theme 和 dartTheme
// • 按照下⾯的写法，我们已经默认适配了暗⿊主题
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const MyApp(),
    );
  }
}