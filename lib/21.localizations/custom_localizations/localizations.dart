// 2.2.1. 创建本地化类
// 该类⽤于定义我们需要进⾏本地化的字符串等信息：
// • 1.我们需要⼀个构造器，并且传⼊⼀个Locale对象（后续会使⽤到）
// • 2.定义⼀个Map，其中存放我们不同语⾔对应的显示⽂本
// • 3.定义它们对应的getter⽅法，根据语⾔环境返回不同的结果

import 'package:flutter/material.dart';

class HYLocalizations {
  final Locale locale; 
  HYLocalizations(this.locale);

  static final Map<String, Map<String, String>> _localizedValues = {
    "en": {"title": "home", "greet": "hello~", "picktime": "Pick a Time"},
    "zh": {"title": "⾸⻚", "greet": "你好~", "picktime": "选择⼀个时间"}
  };
 
  String get title {
    return _localizedValues[locale.languageCode]?["title"] ?? "";
  }

  String get greet {
    return _localizedValues[locale.languageCode]?["greet"] ?? "";
  }

  String get pickTime {
    return _localizedValues[locale.languageCode]?["picktime"] ?? "";
  }

  static HYLocalizations of(BuildContext context) {
    // const Locale local = Locale('zh', 'CN');
    return Localizations.of(context, HYLocalizations);
    // 返回Localizations类型的对象
  }
}
