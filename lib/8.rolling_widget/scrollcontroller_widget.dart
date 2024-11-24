// 五. 监听滚动事件
// 对于滚动的视图，我们经常需要监听它的⼀些滚动事件，在
// 监听到的时候去做对应的⼀些事情。
// ⽐如视图滚动到底部时，我们可能希望做上拉加载更多；
// ⽐如滚动到⼀定位置时显示⼀个回到顶部的按钮，点击回到
// 顶部的按钮，回到顶部；
// ⽐如监听滚动什么时候开始，什么时候结束；
// 在Flutter中监听滚动相关的内容由两部分组成：
// ScrollController和ScrollNotification。

//5.1. ScrollController

// 在Flutter中，Widget并不是最终渲染到屏幕上的元素（真正
// 渲染的是RenderObject），因此通常这种监听事件以及相关
// 的信息并不能直接从Widget中获取，⽽是必须通过对应的
// Widget的Controller来实现。
// ListView、GridView的组件控制器是ScrollController，我们
// 可以通过它来获取视图的滚动信息，并且可以调⽤⾥⾯的⽅法来更新视图的滚动位置。
// 另外，通常情况下，我们会根据滚动的位置来改变⼀些Widget的状态信息，
// 所以ScrollController通常会和StatefulWidget⼀起来使⽤，
// 并且会在其中控制它的初始化、监听、销毁等事件。

// 我们来做⼀个案例，当滚动到1000位置的时候，显示⼀个回到顶部的按钮：
// • jumpTo(double offset)、animateTo(double offset,...)：
// 这两个⽅法⽤于跳转到指定的位置，它们不同之处在于，后者在跳转时会执⾏⼀个动画，⽽前者不会。
// • ScrollController间接继承⾃Listenable，我们可以根据ScrollController来监听滚动事件。

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
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late ScrollController _controller;
  bool _isShowTop = false;

  @override
  void initState() {
    // 初始化ScrollController
    _controller = ScrollController();
    // 监听滚动
    _controller.addListener(() {
      var tempSsShowTop = _controller.offset >= 1000;
      if (tempSsShowTop != _isShowTop) {
        setState(() {
          _isShowTop = tempSsShowTop;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView展示"),
      ),
      body: ListView.builder(
          itemCount: 100,
          itemExtent: 60,
          controller: _controller,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text("item$index"));
          }),
      floatingActionButton: !_isShowTop
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
// jumpTo(double offset)、animateTo(double offset,...)：
// 这两个⽅法⽤于跳转到指定的位置，它们不同之处在于，后者在跳转时会执⾏⼀个动画，⽽前者不会。
// Curves 曲线，沿曲线运动
                _controller.animateTo(0,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.ease);
              },
            ),
    );
  }
}
