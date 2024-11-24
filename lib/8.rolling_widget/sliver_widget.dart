// // Sliver：裂⽚、薄⽚，每⼀个独⽴的滚动视图是⼀个⼩裂⽚。

// // 有这样的布局：⼀个滑动的视图中包括⼀个标题视图（HeaderView），
// // ⼀个列表视图（ListView），⼀个⽹格视图（GridView）。
// // Flutter中有⼀个可以完成这样滚动效果的Widget：CustomScrollView，
// // 可以统⼀管理多个滚动视图。

// // 在CustomScrollView中，每⼀个独⽴的，可滚动的Widget被称之为Sliver。
// // 因为我们需要把很多的Sliver放在⼀个CustomScrollView中，
// // 所以CustomScrollView有⼀个slivers属性，⾥⾯让我们放对应的⼀些Sliver：
// // • SliverList：类似于我们之前使⽤过的ListView；
// // • SliverFixedExtentList：类似于SliverList只是可以设置滚动的⾼度；
// // • SliverGrid：类似于我们之前使⽤过的GridView；
// // • SliverPadding：设置Sliver的内边距，因为可能要单独给Sliver设置内边距；
// // • SliverAppBar：添加⼀个AppBar，作为CustomScrollView的HeaderView；
// // • SliverSafeArea：设置内容显示在安全区域（⽐如不让⻬刘海挡住我们的内容）

// // 4.1. Slivers的基本使⽤ SliverGrid+SliverPadding+SliverSafeArea的组合
// import 'package:flutter/material.dart';

// main(List<String> args) {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("HelloWorld"),
//         ),
//         body: const HomeContent(),
//       ),
//     );
//   }
// }
// // Sliver: ⼀个滑动的视图中包括⼀个标题视图（HeaderView），⼀个列表视图（ListView），⼀个⽹
// // 格视图（GridView）。
// class HomeContent extends StatelessWidget {
//   const HomeContent({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: <Widget>[
//         SliverSafeArea(
//      //  SliverPadding：设置Sliver的内边距，因为可能要单独给Sliver设置内边距；
//           sliver: SliverPadding(
//             padding:const EdgeInsets.all(8),
//             sliver: SliverGrid(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8,
//                 mainAxisSpacing: 8,
//               ),
//               delegate:
//                   SliverChildBuilderDelegate((BuildContext context, int index) {
//                 return Container(
//                   alignment: const Alignment(0, 0),
//                   color: Colors.orange,
//                   child: Text("item$index"),
//                 );
//               }, childCount: 20),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

//4.2. Slivers的组合使⽤
// 这⾥我使⽤官⽅的示例程序，将SliverAppBar+SliverGrid+SliverFixedExtentList做出如下界⾯
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("HelloWorld"),
        ),
        body: const HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    return showCustomScrollView();
  }

  Widget showCustomScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        // SliverAppBar：添加⼀个AppBar，通常⽤来作为CustomScrollView的HeaderView；
        const SliverAppBar(
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Coderwhy Demo'),
            background: Image(
              image: NetworkImage(
                "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // SliverGrid：类似于我们之前使⽤过的GridView；
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            childCount: 10,
          ),
        ),
        // SliverList：类似于我们之前使⽤过的ListView；
        // SliverFixedExtentList：类似于SliverList只是可以设置滚动的⾼度；
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: Text('list item $index'),
            );
          }, childCount: 20),
        ),
      ],
    );
  }
}
