// ⼆. Widget测试
// Widget测试主要是针对某⼀个封装的Widget进⾏单独测试
// 2.1. 添加测试依赖
// Widget测试需要先给 pubspec.yaml ⽂件的 dev_dependencies段添加 flutter_test 依赖。
// • 在单元测试中我们已经说过，默认创建的Flutter项⽬已经添加了
// dev_dependencies:
//  flutter_test:
//  sdk: flutter
// 2.2. 创建测试Widget:

import 'package:flutter/material.dart';

class HYKeywords extends StatelessWidget {
  final List<String> keywords;
  const HYKeywords(this.keywords, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: keywords.map((key) {
          return ListTile(
            leading: const Icon(Icons.people),
            title: Text(key),
          );
        }).toList(),
      ),
    );
  }
}
