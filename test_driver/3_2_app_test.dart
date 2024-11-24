// 3.2. 添加flutter_driver依赖
// 我们需要⽤到 flutter_driver 包来编写 集成测试，所以我们需要把
// flutter_driver 依赖添加到应⽤pubspec.yaml ⽂件的dev_dependencies 位置：
// dev_dependencies:
//  flutter_driver:
//  sdk: flutter
//  flutter_test:
//  sdk: flutter
//  test: any
//  执行flutter pub get 或者 flutter pub upgrade

// 3.3. 创建测试⽂件
// 和单元测试以及Widget测试不同的是，集成测试的程序和待
// 测试的应⽤并不在同⼀个进程内，所以我们通常会创建两个
// ⽂件：
// • ⽂件⼀：⽤于启动带测试的应⽤程序
// • ⽂件⼆：编写测试的代码
// // 我们可以将这两个⽂件放到⼀个⽂件中：test_driver
// --lib/main.dart
// --test_driver/app.dart
// --test_driver/app_test.dart

// 3.4. 编写安装应⽤代码
// 安装应⽤程序代码在test_driver/app.dart中，分层两步完成：
// • 让 flutter driver 的扩展可⽤
// • 运⾏应⽤程序
// test_driver/app.dart ⽂件中增加以下代码：

// 3.5. 编写集成测试代码
// 现在我们有了待测应⽤，我们可以为它编写测试⽂件了。这包含了四个步骤：
// • 创建 SerializableFinders 定位指定组件
// • 在 setUpAll() 函数中运⾏测试案例前，先与待测应⽤建⽴连接
// • 测试重要场景
// • 完成测试后，在 teardownAll() 函数中与待测应⽤断开连接
// test_driver/app_test.dart ⽂件中增加以下代码：

// 3.6. 运⾏集成测试
// ⾸先，启动安卓模拟器或者 iOS 模拟器，或者直接把 iOS 或Android 真机连接到你的电脑上。
// 接着，在项⽬的根⽂件夹下运⾏下⾯的命令：
// flutter drive --target=test_driver/app.dart
// 这个指令的作⽤：
// 1. 创建 --target ⽬标应⽤并且把它安装在模拟器或真机中
// 2. 启动应⽤程序
// 3. 运⾏位于 test_driver/ ⽂件夹下的 app_test.dart 测试套件
// 运⾏结果：我们会发现正常运⾏，并且结果app中的
// FloatingActionButton⾃动被点击了⼀次。

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Counter App Test", () {
    late FlutterDriver driver;
    // 初始化操作
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    // 测试结束操作
    tearDownAll(() {
        driver.close();
    });
    // 编写测试代码
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');
    test("starts at 0", () async {
      expect(await driver.getText(counterTextFinder), "0");
    });
    test("on tap click", () async {
      await driver.tap(buttonFinder);
      expect(await driver.getText(counterTextFinder), "1");
    });
  });
}



// 3.6. 运⾏集成测试
// ⾸先，启动安卓模拟器或者 iOS 模拟器，或者直接把 iOS 或Android 真机连接到你的电脑上。
// 接着，在项⽬的根⽂件夹下运⾏下⾯的命令：
// flutter drive --target=test_driver/app.dart
// 这个指令的作⽤：
// 1. 创建 --target ⽬标应⽤并且把它安装在模拟器或真机中
// 2. 启动应⽤程序
// 3. 运⾏位于 test_driver/ ⽂件夹下的 app_test.dart 测试套件
// 运⾏结果：我们会发现正常运⾏，并且结果app中的
// FloatingActionButton⾃动被点击了⼀次。