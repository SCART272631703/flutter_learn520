import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class HYSizeFit {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double rpx;
  static late double px;
  // 把屏幕的宽或者高分成750份，每一份的单位是1rpx
  static void initialize(BuildContext context, {double standardWidth = 750}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    rpx = screenWidth / standardWidth;
    px = standardWidth / screenWidth;
  }

  // 按照像素来设置
  static double setPx(double size) {
    return HYSizeFit.px * size;
  }

  // 按照rxp来设置
  static double setRpx(double size) {
    return HYSizeFit.rpx * size;
  }
}

extension DoubleFit on double {
  double get px {
    return HYSizeFit.setPx(this);
  }

  double get rpx {
    return HYSizeFit.setRpx(this);
  }
}

extension IntFit on int {
  double get px {
    // toDouble() 把int类型的对象转化为double类型
    return HYSizeFit.setPx(toDouble());
  }

  double get rpx {
    return HYSizeFit.setRpx(toDouble());
  }
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
      home: const HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  const HYHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("⾸⻚"),
      ),
      body: Center(
        child: Container(
          width: 200.0.px,
          height: 200.px,
          color: Colors.red,
          alignment: Alignment.center,
          child: Text(
            "Hello World",
            style:
                TextStyle(fontSize: HYSizeFit.setPx(30), color: Colors.white),
          ),
        ),
      ),
    );
  }
}
