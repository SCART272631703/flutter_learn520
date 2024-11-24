import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 1.媒体查询信息
    final mediaQueryData = MediaQuery.of(context);
    // 2.获取宽度和⾼度
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final dpr = mediaQueryData.devicePixelRatio;
    final physicalWidth = screenWidth * dpr;
    final physicalHeight = screenHeight * dpr;
    debugPrint("屏幕width:$screenWidth height:$screenHeight");
    debugPrint("分辨率: $physicalWidth - $physicalHeight");
    debugPrint("dpr: $dpr");

    // 3.状态栏的⾼度
    // 有刘海的屏幕:44 没有刘海的屏幕为20
    final statusBarHeight = mediaQueryData.padding.top;
    // 有刘海的屏幕:34 没有刘海的屏幕0
    final bottomHeight = mediaQueryData.padding.bottom;
    debugPrint("状态栏height: $statusBarHeight 底部⾼度:$bottomHeight");

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  const HYHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("⾸⻚"),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
          alignment: Alignment.center,
          child: const Text(
            "Hello World",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
