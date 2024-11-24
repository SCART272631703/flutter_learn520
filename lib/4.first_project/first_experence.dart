//3.4. StatefulWidget的实现（随机key）
import 'dart:math';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<String> names = ["aaa", "bbb", "ccc"];
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
            key: ValueKey(Random().nextInt(10000)),
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
      child: Text(widget.name)
    );
  }
}