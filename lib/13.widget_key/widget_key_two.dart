
// flutter之key详解
// 1.1. 在 Flutter 中，Key 是不能重复使⽤的，所以 Key ⼀般⽤来
// 做唯⼀标识。组件在更新的时候，其状态的保存主要是通过
// 判断组件的类型或者 key 值是否⼀致。因此，当各组件的类
// 型不同的时候，类型已经⾜够⽤来区分不同的组件了，此时
// 我们可以不必使⽤ key。但是如果同时存在多个同⼀类型的
// 控件的时候，此时类型已经⽆法作为区分的条件了，我们就
// 需要使⽤到 key。
// 1.2. 运⾏后发现改变 list Widget 顺序后，Widget 颜⾊会变化，
// 但是每个 Widget ⾥⾯的⽂本内容并没有变化？
// 当 List 重新排序后 Flutter 检测到了 Widget 的顺序变化，所
// 以重新绘制 ListWidget，但是 Flutter 发现 List Widget ⾥⾯
// 的元素没有变化，所以就没有改变 Widget ⾥⾯的内容。
// 把 List ⾥⾯的 Box 的颜⾊改成⼀样，这个时候重新对 list 进
// ⾏排序，就很容易理解了。重新排序后虽然执⾏了
// setState，但是代码和以前是⼀样的，所以 Flutter 不会重构
// List Widget ⾥⾯的内容, 也就是 Flutter 没法通过 Box ⾥⾯传
// ⼊的参数来识别 Box 是否改变。如果要让 FLutter 能识别到
// List Widget ⼦元素的改变，就需要给每个 Box 指定⼀个key。

// import 'package:flutter/material.dart';

// void main(List<String> args) {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<Widget> list = [
//     Box(
//       color: Colors.blue,
//     ),
//     Box(
//       color: Colors.red,
//     ),
//     Box(
//       color: Colors.orange,
//     )
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             list.shuffle(); //打乱list的顺序
//           });
//         },
//         child: const Icon(Icons.refresh),
//       ),
//       appBar: AppBar(
//         title: const Text('Title'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: list,
//         ),
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class Box extends StatefulWidget {
//   Color color;
//   Box({super.key, required this.color});
//   @override
//   State<Box> createState() => _BoxState();
// }

// class _BoxState extends State<Box> {
//   int _count = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       width: 100,
//       child: ElevatedButton(
//         style:
//             ButtonStyle(backgroundColor: WidgetStateProperty.all(widget.color)),
//         onPressed: () {
//           setState(() {
//             _count++;
//           });
//         },
//         child: Center(
//           child: Text("$_count"),
//         ),
//       ),
//     );
//   }
// }
// 2、LocalKey、GlobalKey
// 1、 Flutter key ⼦类包含 LocalKey 和 GlobalKey 。
// 局部键（LocalKey）：ValueKey、ObjectKey、UniqueKey。
// 全局键（GlobalKey）： GlobalKey、GlobalObjectKey。
// ValueKey （值key）：把⼀个值作为 key 。
// UniqueKey（唯⼀key）：程序⽣成唯⼀的 Key，当我们不知
// 道如何指定 ValueKey 的时候就可以使⽤ UniqueKey。
// ObjectKey（对象 key）：把⼀个对象实例作为 key。
// GlobalKey：每个 Widget 都对应⼀个 Element ，我们可以直
// 接对 Widget 进⾏操作，但是⽆法直接操作 Widget 对应的
// Element 。⽽ GlobalKey 就是那把直接访问 Element 的钥
// 匙。通过 GlobalKey可以获取到 Widget 对应的 Element 。

// import 'package:flutter/material.dart';

// void main(List<String> args) {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
// //   List<Widget> list = [
// //     Box(
// //       color: Colors.blue,
// //     ),
// //     Box(
// //       color: Colors.red,
// //     ),
// //     Box(
// //       color: Colors.orange,
// //     )
// //   ];
//   List<Widget> list = [
//     Box(
//       key: const ValueKey(1),
//       color: Colors.blue,
//     ),
//     Box(
//       key: ObjectKey(Box(color: Colors.red)),
//       color: Colors.red,
//     ),
//     Box(
//       key: UniqueKey(), //程序⾃动⽣成⼀个key
//       color: Colors.orange,
//     )
//   ];
//   @override
//   Widget build(BuildContext context) {
//     print("---------- _HomePageState build----------");
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             list.shuffle(); //打乱list的顺序
//           });
//         },
//         child: const Icon(Icons.refresh),
//       ),
//       appBar: AppBar(
//         title: const Text('Title'),
//       ),
//       body: Center(
//         child: MediaQuery.of(context).orientation == Orientation.portrait
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: list,
//               )
//             : Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: list,
//               ),
//       ),
//       // body: Center(
//       //   child: Column(
//       //     mainAxisAlignment: MainAxisAlignment.center,
//       //     children: list,
//       //   ),
//       // ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class Box extends StatefulWidget {
//   Color color;
//   Box({super.key, required this.color});
//   @override
//   State<Box> createState() => _BoxState();
// }

// class _BoxState extends State<Box> {
//   int _count = 0;
//   @override
//   Widget build(BuildContext context) {
//     print("---------- _BoxState build----------");
//     return SizedBox(
//       height: 100,
//       width: 100,
//       child: ElevatedButton(
//         style:
//             ButtonStyle(backgroundColor: WidgetStateProperty.all(widget.color)),
//         onPressed: () {
//           setState(() {
//             _count++;
//           });
//         },
//         child: Center(
//           child: Text("$_count"),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//   List<Widget> list = [
//     Box(
//       color: Colors.blue,
//     ),
//     Box(
//       color: Colors.red,
//     ),
//     Box(
//       color: Colors.orange,
//     )
//   ];

  // List<Widget> list = [
  //   Box(
  //     key: const ValueKey(1),
  //     color: Colors.blue,
  //   ),
  //   Box(
  //     key: ObjectKey(Box(color: Colors.red)),
  //     color: Colors.red,
  //   ),
  //   Box(
  //     key: UniqueKey(), //程序⾃动⽣成⼀个key
  //     color: Colors.orange,
  //   )
  // ];

  ///3.GlobalKey
  List<Widget> list = [];
  final GlobalKey _key1 = GlobalKey();
  final GlobalKey _key2 = GlobalKey();
  final GlobalKey _key3 = GlobalKey();

  @override
  void initState() {
    super.initState();
    list = [
      Box(
        key: _key1,
        color: Colors.blue,
      ),
      Box(
        key: _key2,
        color: Colors.red,
      ),
      Box(
        key: _key3,
        color: Colors.orange,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    print("---------- _HomePageState build----------");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.shuffle(); //打乱list的顺序
          });
        },
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              ),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: list,
      //   ),
      // ),
    );
  }
}

// ignore: must_be_immutable
class Box extends StatefulWidget {
  Color color;
  Box({super.key, required this.color});
  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    print("---------- _BoxState build----------");
    return SizedBox(
      height: 100,
      width: 100,
      child: ElevatedButton(
        style:
            ButtonStyle(backgroundColor: WidgetStateProperty.all(widget.color)),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Center(
          child: Text("$_count"),
        ),
      ),
    );
  }
}
