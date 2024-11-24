// ⼀. 国际化的认识
// 开发⼀个App，如果我们的App需要⾯向不同的语种（⽐如中⽂、英⽂、繁体等），那么我们需要对其进⾏国际化开发。
// 国际化的英⽂称呼：internationalization（简称为i18n，取前后两个字⺟，18表示中间省略字⺟的个数）
// App国际化开发主要包括：⽂本国际化（包括⽂本的顺序），Widget显示的国际化：
// • ⽐如我们下⾯开发的这个App
// • 某些⽂本在英⽂环境下应该显示为英⽂；
// • 某些Widget在中⽂环境下，应该显示中⽂（⽐如弹出的时间选择器）；

// ⼆. 国际化的适配
// 2.1. Widget的国际化Flutter给我们提供的Widget默认情况下就是⽀持国际化，但
// 是在没有进⾏特别的设置之前，它们⽆论在什么环境都是以英⽂的⽅式显示的。
// 如果想要添加其他语⾔，你的应⽤必须指定额外的MaterialApp 属性并且添加⼀个单独的 package，叫做
// flutter_localizations。
// • 截⾄到 2020 年 2 ⽉份，这个 package 已经⽀持⼤约77 种语⾔。

// 2.1.1. pubspec添加依赖
// 想要使⽤ flutter_localizations 的话，我们需要在pubspec.yaml ⽂件中添加它作为依赖：
// dependencies:
//  flutter:
//    sdk: flutter
//  flutter_localizations:
//    sdk: flutter

// 2.1.2. 设置MaterialApp
// • 在localizationsDelegates中指定哪些Widget需要进⾏国际化
// • ⽤于⽣产本地化值集合的⼯⼚
// • 我们这⾥指定了Material、Widgets、Cupertino都使⽤国际化
// • supportedLocales指定要⽀持哪些国际化
// • 我们这⾥指定中⽂和英⽂（也可以指定国家编码）

// 设置完成后，我们在Android上将语⾔切换为中⽂，查看结果：
// 但是对于iOS，将语⾔切换为中⽂，依然显示是英⽂的Widget
// • 这是因为iOS定义了⼀些应⽤的元数据，其中包括⽀持的语⾔环境；
// • 我们必须将其对应的元数据中⽀持的语⾔添加进去；
// • 元数据的设置在iOS项⽬中对应的info.plist⽂件中；修改iOS的info.plist⽂件配置：
// • 选择 Information Property List 项；
// • 从 Editor 菜单中选择 Add Item，然后从弹出菜单中选择 Localizations；
// • 为array添加⼀项选择 Add Item，选择Chinese；
// 配置完成后，卸载之前的app，重新安装：

// 3. 对App中系统自带的Widget（比如日历等）进行国际化
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        // localizationsDelegates：指定哪些Widget需要进⾏国际化
        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和⼀些其他的值
        GlobalCupertinoLocalizations.delegate, // 对应的Cupertino⻛格
        GlobalWidgetsLocalizations.delegate // 指定默认的⽂本排列⽅向, 由左到右或由右到左
      ],
      supportedLocales: const [
        // // supportedLocales：要⽀持哪些国际化：中文、英文等
        // Locale("en"),
        // Locale("zh")
        Locale.fromSubtags(languageCode: 'zh'),
        Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hans'), // generic simplified Chinese 'zh_Hans'
        Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hant'), // generic traditional Chinese 'zh_Hant'
        Locale.fromSubtags(
            languageCode: 'zh', // 语言编码
            scriptCode: 'Hans', // 描述码
            countryCode: 'CN'), // 国家编码 'zh_Hans_CN'
        Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hant',
            countryCode: 'TW'), // 'zh_Hant_TW'
        Locale.fromSubtags(
            languageCode: 'zh', scriptCode: 'Hant', countryCode: 'HK'),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  HYHomePage({super.key});
  final GlobalKey<AnimationDemo01State> demo01Key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("动画测试"),
      ),
      body: AnimationDemo01(key: demo01Key),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_circle_filled),
        onPressed: () {
          var currentState = demo01Key.currentState;
          if (currentState == null) return;
          if (!currentState.controller.isAnimating) {
            currentState.controller.forward();
          } else {
            currentState.controller.stop();
          }
        },
      ),
    );
  }
}

class AnimationDemo01 extends StatefulWidget {
  const AnimationDemo01({super.key});
  @override
  AnimationDemo01State createState() => AnimationDemo01State();
}

class AnimationDemo01State extends State<AnimationDemo01>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    // 1.创建AnimationController
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    // 2.动画添加Curve效果
    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.elasticInOut,
        reverseCurve: Curves.easeOut);
    // 3.监听动画
    // 4.控制动画的翻转
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    // 5.设置值的范围
    animation = Tween(begin: 50.0, end: 120.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('----------- AnimationDemo01State build -----------');
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (ctx, child) {
          return Icon(
            Icons.favorite,
            color: Colors.red,
            size: animation.value,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
