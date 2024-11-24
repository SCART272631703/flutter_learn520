// 2.2.4. 异步加载数据
// 假如我们的数据是异步加载的，⽐如来⾃Json⽂件或者服务器，应该如何处理呢？
// 这⾥我们可以修改HYLocalizations的数据加载：

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HYLoadLocalizations {
  final Locale locale;
  HYLoadLocalizations(this.locale);
  static Map<String, Map<String, String>> _localizedValues = {};

  Future<bool> loadJson() async {
    // 1.加载json⽂件
    String jsonString = await rootBundle.loadString("assets/jsons/i18n.json");

    // 2.转成map类型
    final Map<String, dynamic> map = json.decode(jsonString);
    
    // 3.注意：这⾥是将Map<String, dynamic>转成Map<String, Map<String, String>>类型
    _localizedValues = map.map((key, value) {
      return MapEntry(key, value.cast<String, String>());
    });
    return true;
  }

  String get title {
    return _localizedValues[locale.languageCode]?["title"] ?? "";
  }

  String get greet {
    return _localizedValues[locale.languageCode]?["greet"] ?? "";
  }

  String get pickTime {
    return _localizedValues[locale.languageCode]?["picktime"] ?? "";
  }

  static HYLoadLocalizations of(BuildContext context) {
    // const Locale local = Locale('zh', 'CN');
    return Localizations.of(context, HYLoadLocalizations);
    // 返回Localizations类型的对象
  }
}
