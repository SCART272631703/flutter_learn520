// 1. 当需要在⼀个 StatefulWidget 集合中进⾏添加、删除、重排
// 序等操作时，就需要传⼊ Key 了。
// 接下来我们实现⼀个⻚⾯，把两个颜⾊块放到⼀个 Row 中
// 去，并添加⼀个 FloatingActionButton ⽤于实现切换颜⾊块
// 位置的功能。代码如下：

// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Key Demo',
//       theme: ThemeData(primarySwatch: Colors.teal),
//       home: const PositionedTiles(),
//     );
//   }
// }

// class StatelessColorfulTile extends StatelessWidget {
//   final Color color = UniqueColorGenerator.getColor();
//   StatelessColorfulTile({super.key});
//   @override
//   Widget build(BuildContext context) =>
//       Container(width: 100, height: 100, color: color);
// }

// class UniqueColorGenerator {
//   static List<Color> colors = [
//     Colors.red,
//     Colors.green,
//     Colors.blue,
//     Colors.yellow,
//     Colors.purple,
//   ];
//   static Random random = Random();
//   static Color getColor() => colors[random.nextInt(colors.length)];
// }

// class PositionedTiles extends StatefulWidget {
//   const PositionedTiles({super.key});
//   @override
//   State<StatefulWidget> createState() => PositionedTilesState();
// }

// class PositionedTilesState extends State<PositionedTiles> {
//   late List<Widget> _tiles;
//   @override
//   void initState() {
//     super.initState();
//     _tiles = [StatelessColorfulTile(), StatelessColorfulTile()];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Key Demo")),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: _tiles,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: swapTiles,
//         child: const Icon(Icons.swap_horiz),
//       ),
//     );
//   }

//   void swapTiles() {
//     setState(() {
//       _tiles.insert(1, _tiles.removeAt(0));
//     });
//   }
// }

// 运⾏⼀下看看，发现点击右下⻆的 FAB 按钮能够正常的切换
// 两个颜⾊块的位置。
// 2.1. 接下来再看看 Stateful ⽅式的颜⾊块能不能正常切换。

// import 'dart:math';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Key Demo',
//       theme: ThemeData(primarySwatch: Colors.teal),
//       home: const PositionedTiles(),
//     );
//   }
// }

// // 2.2. 颜⾊块代码改为⽤ StatefulWidget
// // class StatelessColorfulTile extends StatelessWidget {
// //   final Color color = UniqueColorGenerator.getColor();
// //   StatelessColorfulTile({super.key});
// //   @override
// //   Widget build(BuildContext context) =>
// //       Container(width: 100, height: 100, color: color);
// // }
// class StatefulColorfulTile extends StatefulWidget {
//   const StatefulColorfulTile({super.key});
//   @override
//   State<StatefulWidget> createState() => _StatefulColorfulTileState();
// }

// class _StatefulColorfulTileState extends State<StatefulColorfulTile> {
//   final Color color = UniqueColorGenerator.getColor();
//   @override
//   Widget build(BuildContext context) =>
//       Container(width: 100, height: 100, color: color);
// }

// class UniqueColorGenerator {
//   static List<Color> colors = [
//     Colors.red,
//     Colors.green,
//     Colors.blue,
//     Colors.yellow,
//     Colors.purple,
//   ];
//   static Random random = Random();
//   static Color getColor() => colors[random.nextInt(colors.length)];
// }

// class PositionedTiles extends StatefulWidget {
//   const PositionedTiles({super.key});
//   @override
//   State<StatefulWidget> createState() => PositionedTilesState();
// }

// class PositionedTilesState extends State<PositionedTiles> {
//   late List<Widget> _tiles;
//   @override
//   void initState() {
//     super.initState();
//     // 2.3. 把 PositionedTilesState 中的 _tiles 的内容替换为StatefulColorfulTile
//     _tiles = [const StatefulColorfulTile(), const StatefulColorfulTile()];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Key Demo")),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: _tiles,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: swapTiles,
//         child: const Icon(Icons.swap_horiz),
//       ),
//     );
//   }

//   void swapTiles() {
//     setState(() {
//       _tiles.insert(1, _tiles.removeAt(0));
//     });
//   }
// }
// 2.4.最后运⾏⼀下看看，是不是能够正常切换两个颜⾊块的位置了？答案是：不能切换了。Interesting!

// 3. Stateful + Key ⽅式
// 要想让 StatefulWidget 也能正常切换的话，就需要⽤到 Key
// 这个参数，给每个颜⾊块传⼊⼀个独⽴的 Key。
// 先不管原理，我们试⼀下再说。把 PositionedTilesState 中的 _tiles 的内容修改如下，添加Key：

// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Key Demo',
//       theme: ThemeData(primarySwatch: Colors.teal),
//       home: const PositionedTiles(),
//     );
//   }
// }

// // 2.2. 颜⾊块代码改为⽤ StatefulWidget
// // class StatelessColorfulTile extends StatelessWidget {
// //   final Color color = UniqueColorGenerator.getColor();
// //   StatelessColorfulTile({super.key});
// //   @override
// //   Widget build(BuildContext context) =>
// //       Container(width: 100, height: 100, color: color);
// // }
// class StatefulColorfulTile extends StatefulWidget {
//   const StatefulColorfulTile({super.key});
//   @override
//   State<StatefulWidget> createState() => _StatefulColorfulTileState();
// }

// class _StatefulColorfulTileState extends State<StatefulColorfulTile> {
//   final Color color = UniqueColorGenerator.getColor();
//   @override
//   Widget build(BuildContext context) =>
//       Container(width: 100, height: 100, color: color);
// }

// class UniqueColorGenerator {
//   static List<Color> colors = [
//     Colors.red,
//     Colors.green,
//     Colors.blue,
//     Colors.yellow,
//     Colors.purple,
//   ];
//   static Random random = Random();
//   static Color getColor() => colors[random.nextInt(colors.length)];
// }

// class PositionedTiles extends StatefulWidget {
//   const PositionedTiles({super.key});
//   @override
//   State<StatefulWidget> createState() => PositionedTilesState();
// }

// class PositionedTilesState extends State<PositionedTiles> {
//   late List<Widget> _tiles;
//   @override
//   void initState() {
//     super.initState();
//     // 2.3. 把 PositionedTilesState 中的 _tiles 的内容替换为StatefulColorfulTile
//     // _tiles = [const StatefulColorfulTile(), const StatefulColorfulTile()];
//     // 3.1. 把 PositionedTilesState 中的 _tiles 的内容修改如下，添加Key：
//     _tiles = [
//       StatefulColorfulTile(key: UniqueKey()),
//       StatefulColorfulTile(key: UniqueKey()),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Key Demo")),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: _tiles,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: swapTiles,
//         child: const Icon(Icons.swap_horiz),
//       ),
//     );
//   }

//   void swapTiles() {
//     setState(() {
//       _tiles.insert(1, _tiles.removeAt(0));
//     });
//   }
// }

// 然后在运⾏⼀下看看，发现可以正常切换颜⾊块的位置了。
// 关于原理，我们要从 Widget / Element 的更新机制说起。
// 4. Widget / Element 的更新机制
// Widget 源码中有个 canUpdate ⽅法：
// @immutable
// abstract class Widget extends DiagnosticableTree {
//  /// Initializes [key] for subclasses.
//  const Widget({ this.key });
//  final Key key;
//  ·········
//  static bool canUpdate(Widget oldWidget, Widget newWidget)
// {
//  return oldWidget.runtimeType == newWidget.runtimeType
//  && oldWidget.key == newWidget.key;
//  }
// }
// 我们知道 Widget 只是⼀个配置，是不可以修改的。Element
// 才是真正被使⽤的对象，它是可以修改的。
// 当有新的 Widget 时，会⽐较新旧 Widget 的类型和 Key，如
// 果完全⼀样，则返回 True，表示只需要更新 Widget 即可，
// 和 Widget 关联的 Element 不需要更新，Element 指向新的
// Widget。反之如果类型或者 Key 不⼀样，则返回 false，
// Widget 和 Element 都需要更新。
// 当我们不传⼊ Key 的时候，只⽐较 runtimeType。由于例⼦
// 中我们的两个颜⾊块是同⼀个类型的，所以 canUpdate 都返
// 回 true。
// 下⾯通过源码看看 Stateless 和 Stateful 两种更新机制
// Stateless
// 看下 StatelessWidget 的源码：
// abstract class StatelessWidget extends Widget {
//  const StatelessWidget({ Key key }) : super(key: key);
//  @override
//  StatelessElement createElement() =>
// StatelessElement(this);
//  @protected
//  Widget build(BuildContext context);
// }
// 可以看到 StatelessWidget 关联了 StatelessElement。
// 看下 StatelessElement 的源码：
// class StatelessElement extends ComponentElement {
//  StatelessElement(StatelessWidget widget) : super(widget);
//  @override
//  StatelessWidget get widget => super.widget as
// StatelessWidget;
//  @override
//  Widget build() => widget.build(this);
//  ···········
// }
// 可以看到 StatelessElement 会调⽤ StatelessWidget 的 build
// ⽅法来获取 Widget。
// 所以，当新的 Widget 来了，直接调⽤新的 Widget 的 build
// ⽅法就能够更新画⾯了，不需要更新 StatelessElement。
// 这就是 canUpdate 返回 true，也能正常切换颜⾊块的原因。
// Stateful
// 看下 StatefulWidget 的源码：
// abstract class StatefulWidget extends Widget {
//  const StatefulWidget({ Key key }) : super(key: key);
//  @override
//  StatefulElement createElement() => StatefulElement(this);
//  @protected
//  State createState();
// }
// 可以看到 StatefulWidget 关联了 StatefulElement。
// 看下 StatefulElement 的源码：
// class StatefulElement extends ComponentElement {
//  StatefulElement(StatefulWidget widget)
//  : _state = widget.createState(),
//  super(widget) {
//  ··········
//  }
//  @override
//  Widget build() => _state.build(this);
//  State<StatefulWidget> get state => _state;
//  State<StatefulWidget> _state;
//  ··········
// }
// 可以看到，StatefulElement 会调⽤ State 的 build ⽅法来获
// 取 Widget。所以，当新的 Widget 来了，canUpdate 返回
// true，虽然 StatefulWidget 更新了，但是 StatefulElement
// 中的 _state 还是⽼的 StatefulWidget 的 state，⾃然⻚⾯也
// 不会有什么变化了。所以 StatefulElement 必须要更新才能
// 正常切换颜⾊块。
// 可以看到 RenderObjectElement 中的 updateChildren ⽅法
// 中有这么⼀段源码：
// Map<Key, Element> oldKeyedChildren;
// ······
// final Widget newWidget = newWidgets[newChildrenTop];
// if (haveOldChildren) {
//  final Key key = newWidget.key;
//  if (key != null) {
//  oldChild = oldKeyedChildren[key];
//  ········
// }
// ·········
// final Element newChild = updateChild(oldChild, newWidget,
// IndexedSlot<Element>(newChildrenTop, previousChild));
// newChildren[newChildrenTop] = newChild;
// previousChild = newChild;
// ·········

// 5. 如果设置了 Key，那么 RenderObjectElement 就会⽤新的
// Widget 的 Key 在⽼的 Element 列表中搜索，找出匹配这个
// Key 的 Element 来更新，如果没有⼀样 Key 的 Element，则
// 创建⼀个新的 Element。伴随着 Element 的更新，对应的
// RenderObject 也会跟着更新，⾃然画⾯也就正常变化了。
// 上⽂提到的在⽼的 Element 列表中搜索新的 Widget 的 Key
// 匹配的 Element，这个⽼的 Element 列表必须被⼀个⽗
// Element 包含着。如果是不同的⽗ Element，是检索不到的。
// ⽐如下⾯的例⼦，
// 5.2. 我们把 _tiles ⾥⾯的两个颜⾊块再包裹⼀
// 层：这时候运⾏⼀下看看，颜⾊块还是能切换的。但是这时候因
// 为在⽼的 Element 列表⾥⾯检索不到，所以会重新创建⼀个
// 新的 Element，你会发现颜⾊会随机变化，已经不是原来的
// 颜⾊了。

// 为了解决问题，必须把 Key 设置到同⼀个⽗ Widget 的两个
// Container 上去，如下：

// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Key Demo',
//       theme: ThemeData(primarySwatch: Colors.teal),
//       home: const PositionedTiles(),
//     );
//   }
// }

// class StatefulColorfulTile extends StatefulWidget {
//   const StatefulColorfulTile({super.key});
//   @override
//   State<StatefulWidget> createState() => _StatefulColorfulTileState();
// }

// class _StatefulColorfulTileState extends State<StatefulColorfulTile> {
//   final Color color = UniqueColorGenerator.getColor();
//   @override
//   Widget build(BuildContext context) =>
//       Container(width: 100, height: 100, color: color);
// }

// class UniqueColorGenerator {
//   static List<Color> colors = [
//     Colors.red,
//     Colors.green,
//     Colors.blue,
//     Colors.yellow,
//     Colors.purple,
//   ];
//   static Random random = Random();
//   static Color getColor() => colors[random.nextInt(colors.length)];
// }

// class PositionedTiles extends StatefulWidget {
//   const PositionedTiles({super.key});
//   @override
//   State<StatefulWidget> createState() => PositionedTilesState();
// }

// class PositionedTilesState extends State<PositionedTiles> {
//   late List<Widget> _tiles;
//   @override
//   void initState() {
//     super.initState();
//     // 3.1. 把 PositionedTilesState 中的 _tiles 的内容修改如下，添加Key：
//     //     _tiles = [
//     //       StatefulColorfulTile(key: UniqueKey()),
//     //       StatefulColorfulTile(key: UniqueKey()),
//     //     ];
//     // 5.1. 这个⽼的 Element 列表必须被⼀个⽗Element 包含着。
//     // 如果是不同的⽗ Element，是检索不到的。
//     // ⽐如下⾯的例⼦，我们把 _tiles ⾥⾯的两个颜⾊块再包裹⼀层：
//     // _tiles = [
//     //   Container(
//     //     child: StatefulColorfulTile(key: UniqueKey()),
//     //   ),
//     //   Container(
//     //     child: StatefulColorfulTile(key: UniqueKey()),
//     //   ),
//     // ];
//     // 5.2. 为了解决问题，必须把 Key 设置到同⼀个⽗ Widget 的两个
//     // Container 上去，如下：
//     _tiles = [
//       Container(
//         key: UniqueKey(),
//         child: const StatefulColorfulTile(),
//       ),
//       Container(
//         key: UniqueKey(),
//         child: const StatefulColorfulTile(),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Key Demo")),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: _tiles,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: swapTiles,
//         child: const Icon(Icons.swap_horiz),
//       ),
//     );
//   }

//   void swapTiles() {
//     setState(() {
//       _tiles.insert(1, _tiles.removeAt(0));
//     });
//   }
// }
// 运⾏之后发现颜⾊不会随机变化了。
// ⾄此，你已经了解了 Key 的作⽤以及原理的。


// 6. 那么到底有哪⼏种 Key 呢？
// 1. Key
// @immutable
// abstract class Key {
//  const factory Key(String value) = ValueKey<String>;
//  @protected
//  const Key.empty();
// }
// Key 默认是使⽤ ValueKey
// Key 有两个⼦类 LocalKey 和 GlobalKey
// 2. LocalKey
// LocalKey 的⽤途是同⼀个⽗ Widget 下的所有⼦ Widget 进
// ⾏⽐较。⽐如上⽂提到的例⼦。
// Localkey 有三个⼦类
// 1. ValueKey：以⼀个值作为 Key
// 2. ObjectKey：以⼀个对象作为 Key。当多个值才能唯⼀
// 标识的时候，将这多个值组合成⼀个对象。⽐如【学校
// + 学号】才能唯⼀标识⼀个学⽣。
// 3. UniqueKey：⽣成唯⼀随机数（对象的 Hash 值）作为
// Key。注意：如果直接在控件构建的时候⽣成，那么每
// 次构建都会⽣成不同的 Key。
// Valuekey 有个⼦类：PageStorageKey，专⻔⽤于存储⻚⾯
// 滚动位置。
// 3. GlobalKey
// 通过 GlobalKey 能够跨 Widget 访问状态。
// 看⼀个例⼦，如下：

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Key Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<_SwitcherState> _globalKey = GlobalKey<_SwitcherState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text("GlobalKey Demo"),
      ),
      body: Switcher(key: _globalKey),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _globalKey.currentState?.changeState(),
      ),
    );
  }
}

class Switcher extends StatefulWidget {
  const Switcher({super.key});
  @override
  State<StatefulWidget> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  late bool _isActive;
  @override
  void initState() {
    super.initState();
    _isActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Switch.adaptive(
        value: _isActive,
        onChanged: (value) {
          _isActive = value;
          setState(() {});
        },
      ),
    );
  }

  changeState() {
    _isActive = !_isActive;
    setState(() {});
  }
}
// body 处有个 Switch 控件。
// floatingActionButton 有⼀个 FAB 按钮。
// 给 Switcher 设置了⼀个 GlobalKey，然后再 FAB 按钮⾥⾯
// 就能⽤这个 GlobalKey 访问 Switcher 的 State 了，通过
// Switcher 的 State 来控制 Switcher 的开关.
