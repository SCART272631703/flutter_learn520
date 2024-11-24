// 2.3. 编写测试代码
// 创建对应的测试⽂件，编写对应的测试代码：
// • testWidgets：flutter_test中⽤于测试Widget的函数；
// • tester.pumpWidget：pumpWidget ⽅法会建⽴并渲染我们提供的 widget；
// • find：find() ⽅法来创建我们的 Finders；
// • findsNothing：验证没有可被查找的 widgets。
// • findsWidgets：验证⼀个或多个 widgets 被找到。
// • findsNWidgets：验证特定数量的 widgets 被找到。


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn520/22.test/2_2_keywords.dart';

void main() {
  testWidgets("KeywordWidget Test", (WidgetTester tester) async {
    // testWidgets：flutter_test中⽤于测试Widget的函数；
    await tester.pumpWidget(const MaterialApp(
      // tester.pumpWidget：pumpWidget ⽅法会建⽴并渲染我们提供的 widget；
      title: "demo",
      home: HYKeywords(["abc", "cba", "nba"]),
    ));
    final abcText = find.text("abc");
    // find：find() ⽅法来创建我们的 Finders；
    final cbaText = find.text("cba");
    final icons = find.byIcon(Icons.people);
    expect(abcText, findsOneWidget);
    // findsNothing：验证没有可被查找的 widgets。
    // findsWidgets：验证⼀个或多个 widgets 被找到。
    expect(cbaText, findsOneWidget);
    // expect(icons, findsOneWidget);
    expect(icons, findsNWidgets(3));
    // findsNWidgets：验证特定数量的 widgets 被找到。
  });
}
