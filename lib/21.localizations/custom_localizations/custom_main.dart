// 2.2.3. 使⽤本地化类接着我们可以在代码中使⽤HYLocalization类。
// • 我们可以通过Localizations.of(context, HYLocalizations)，获取到HYLocalizations对象

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'hy_localizations_delegate.dart';
import 'localizations.dart';

void main() {
  runApp(const MyApp());
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
      localizationsDelegates: const [
        HYLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和⼀些其他的值
        GlobalCupertinoLocalizations.delegate, // 对应的Cupertino⻛格
        GlobalWidgetsLocalizations.delegate // 指定默认的⽂本排列⽅向, 由左到右或由右到左
      ],
      supportedLocales: const [
        Locale('zh'),
        Locale('en'),
      ],
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HYLocalizations.of(context).title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(HYLocalizations.of(context).greet),
            TextButton(
              child: Text(HYLocalizations.of(context).pickTime),
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2019),
                        lastDate: DateTime(2025))
                    .then((pickTime) {});
              },
            )
          ],
        ),
      ),
    );
  }
}
