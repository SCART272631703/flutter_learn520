import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Key Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const PositionedTiles(),
    );
  }
}

class StatelessColorfulTile extends StatelessWidget {
  final Color color = UniqueColorGenerator.getColor();
  StatelessColorfulTile({super.key});
  @override
  Widget build(BuildContext context) =>
      Container(width: 100, height: 100, color: color);
}

class UniqueColorGenerator {
  static List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];
  static Random random = Random();
  static Color getColor() => colors[random.nextInt(colors.length)];
}

class PositionedTiles extends StatefulWidget {
  const PositionedTiles({super.key});
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  late List<Widget> _tiles;
  @override
  void initState() {
    super.initState();
    _tiles = [StatelessColorfulTile(), StatelessColorfulTile()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Key Demo")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }

  void swapTiles() {
    setState(() {
      _tiles.insert(1, _tiles.removeAt(0));
    });
  }
}
