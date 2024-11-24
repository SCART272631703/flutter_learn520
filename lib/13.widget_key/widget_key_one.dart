// // 3.5. StatefulWidget的实现（name为key）
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
      home: const MyHomePage(title: 'abc'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}):assert(title == 'abc', 'title isnot abc');
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

// //3.4. StatefulWidget的实现（随机key）
// // import 'dart:math';
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key, required this.title});
// //   final String title;

// //   @override
// //   State<MyHomePage> createState() => _HYHomePageState();
// // }

// // class _HYHomePageState extends State<MyHomePage> {
// //   List<String> names = ["aaa", "bbb", "ccc"];
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Test Key"),
// //       ),
// //       body: ListView(
// //         children: names.map((name) {
// //           return ListItemFul(
// //             name,
// //             key: ValueKey(Random().nextInt(10000)),
// //           );
// //         }).toList(),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //           child: const Icon(Icons.delete),
// //           onPressed: () {
// //             setState(() {
// //               names.removeAt(0);
// //             });
// //           }),
// //     );
// //   }
// // }

// // class ListItemFul extends StatefulWidget {
// //   final String name;
// //   const ListItemFul(this.name, {required key}) : super(key: key);
// //   @override
// //   _ListItemFulState createState() => _ListItemFulState();
// // }

// // class _ListItemFulState extends State<ListItemFul> {
// //   final Color randomColor = Color.fromARGB(
// //       255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 60,
// //       child: Text(widget.name),
// //       color: randomColor,
// //     );
// //   }
// // }


// //3.3. StatefulWidget的实现（没有key）
// // import 'dart:math';
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key, required this.title});
// //   final String title;

// //   @override
// //   State<MyHomePage> createState() => _HYHomePageState();
// // }

// // class _HYHomePageState extends State<MyHomePage> {
// //   List<String> names = ["aaa", "bbb", "ccc"];
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Test Key"),
// //       ),
// //       body: ListView(
// //         children: names.map((name) {
// //           return ListItemLess(name);
// //         }).toList(),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //           child: const Icon(Icons.delete),
// //           onPressed: () {
// //             setState(() {
// //               names.removeAt(0);
// //             });
// //           }),
// //     );
// //   }
// // }

// // class ListItemLess extends StatelessWidget {
// //   final String name;
// //   final Color randomColor = Color.fromARGB(
// //       255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
// //   ListItemLess(this.name);
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 60,
// //       child: Text(name),
// //       color: randomColor,
// //     );
// //   }
// // }


// //3.2. StatelessWidget的实现
// // import 'dart:math';
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key, required this.title});
// //   final String title;

// //   @override
// //   State<MyHomePage> createState() => _HYHomePageState();
// // }

// // class _HYHomePageState extends State<MyHomePage> {
// //   List<String> names = ["aaa", "bbb", "ccc"];
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Test Key"),
// //       ),
// //       body: ListView(
// //         children: names.map((name) {
// //           return ListItemLess(name);
// //         }).toList(),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //           child: const Icon(Icons.delete),
// //           onPressed: () {
// //             setState(() {
// //               names.removeAt(0);
// //             });
// //           }),
// //     );
// //   }
// // }

// // class ListItemLess extends StatelessWidget {
// //   final String name;
// //   final Color randomColor = Color.fromARGB(
// //       255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
// //   ListItemLess(this.name);
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 60,
// //       child: Text(name),
// //       color: randomColor,
// //     );
// //   }
// // }