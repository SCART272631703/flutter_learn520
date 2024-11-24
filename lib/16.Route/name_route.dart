import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          "/": (context) => const HomePage(),
          "/about": (context) => const AboutPage(),
        },
        initialRoute: "/",
        // 和name对应的route在routes中没有有映射关系
        onGenerateRoute: (settings) {
          if (settings.name == "/detail") {
            return MaterialPageRoute(builder: (context) {
              return DetailPage(
                message: settings.arguments as String,
              );
            });
          }
          return null;
        },
        // 路由名称根本不存在
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) {
            return const UnknowPage();
          });
        });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ts"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  Future res = Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const DetailPage(
                        message: "232",
                      );
                    },
                  ));
                  res
                      .then((value) => debugPrint(value))
                      .catchError((error) => {debugPrint(error)});
                },
                child: const Text("商品详情")),
            TextButton(
                onPressed: () {
                  /// 传递参数
                  Navigator.of(context)
                      .pushNamed("/about", arguments: {"12": 12, "112": "112"});
                },
                child: const Text("关于")),
            TextButton(
                onPressed: () {
                  /// 传递参数
                  Navigator.of(context)
                      .pushNamed("/detail", arguments: "商品详情2");
                },
                child: const Text("商品详情2")),
            TextButton(
                onPressed: () {
                  /// 传递参数
                  Navigator.of(context).pushNamed("/setting", arguments: "设置");
                },
                child: const Text("设置")),
          ],
        )));
  }
}

class DetailPage extends StatefulWidget {
  final String? message;
  const DetailPage({required this.message, super.key});
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("商品详情"),
        ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            if (didPop) {
              return;
            }
            Navigator.of(context).pop('123');
          },
          child: Center(
            child: Column(
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop([1, 2, 3]);
                    },
                    child: Text("12${widget.message}"))
              ],
            ),
          ),
        ));
  }
}

class AboutPage extends StatefulWidget {
  final String? message;
  const AboutPage({this.message, super.key});
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    /// 获取参数
    var ds = ModalRoute.of(context)?.settings.arguments;
    debugPrint("ds = $ds");
    return Scaffold(
        appBar: AppBar(
          title: const Text("关于"),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("返回上⼀⻚"))
            ],
          ),
        ));
  }
}

class UnknowPage extends StatefulWidget {
  const UnknowPage({super.key});
  @override
  State<UnknowPage> createState() => _UnknowPageState();
}

class _UnknowPageState extends State<UnknowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("错误界⾯"),
        ),
        body: const Center(
          child: Text("错误界⾯"),
        ));
  }
}
