import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          "/": (BuildContext context) => const HomePage(),
          "/detail": (BuildContext context) => const DetailPage(),
        },
        initialRoute: "/",
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == '/setting') {
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return SettingPage(message: settings.arguments as String);
              },
            );
          } else {
            return null;
          }
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return const SettingPage(message: 'onUnknownRoute_push_333');
            },
          );
        });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  String message1 = '';
  String message2 = '';
  String message3 = '';
  String message4 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => _onPushTap(context, 'push_111'),
                    child: const Text('Tap AboutPage')),
                Text(message1.toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => _onPushNameTap(context,
                        routeName: '/detail', arguments: 'pushName_222'),
                    child: const Text('Tap DetailPage')),
                Text(message2.toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => _onPushNameTap(context,
                        routeName: '/setting', arguments: 'pushName_333'),
                    child: const Text('Tap SettingPage')),
                Text(message3.toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => _onPushNameTap(context,
                        routeName: '/unkown', arguments: 'pushName_444'),
                    child: const Text('Tap UnkownPage')),
                Text(message4.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onPushNameTap(BuildContext context,
      {required String routeName, required Object arguments}) {
    debugPrint(
        '---------- routeName: $routeName, arguments: $arguments ----------');
    Future future =
        Navigator.of(context).pushNamed(routeName, arguments: arguments);
    future.then((value) {
      setState(() {
        if (routeName == '/detail') {
          message2 = value;
        } else if (routeName == '/setting') {
          message3 = value;
        } else {
          message4 = value;
        }
      });
    });
  }

  void _onPushTap(BuildContext context, String mes) {
    Future future = Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AboutPage(
        message: mes,
      );
    }));
    future.then((value) {
      setState(() {
        message1 = value;
      });
    });
  }
}

class DetailPage extends StatefulWidget {
  final String? message;
  const DetailPage({this.message, super.key});
  @override
  State<StatefulWidget> createState() {
    return DetailPageState();
  }
}

// flutter String? 转 String
// 在Flutter中，String? 表示可能为 null 的字符串类型。要将 String? 转换为 String，可以使用 ?? 操作符提供一个默认值，或者使用 ! 来断言该字符串不为 null。
// 使用 ?? 操作符提供默认值的例子：
// String? maybeNull = ...; // 假设这是一个可能为null的字符串
// String nonNull = maybeNull ?? 'defaultString'; // 如果maybeNull为null，则使用'defaultString'
// 使用 ! 来断言字符串不为 null 的例子：
// String? maybeNull = ...; // 假设这是一个可能为null的字符串
// String nonNull = maybeNull!; // 假设你确定maybeNull不为null，否则会抛出异常
// 请注意，使用 ! 时如果 maybeNull 是 null，会抛出一个异常。因此，请确保在使用 ! 之前字符串确实不为 null。如果不确定变量是否为 null，请使用 ?? 操作符或条件表达式来安全地处理 null 值。
class DetailPageState extends State {
  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments.toString();
    String string = arguments ?? '';
    return Scaffold(
        appBar: AppBar(
          title: const Text('DetailPage'),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop("DetailPage_$arguments");
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Center(
            child: SizedBox(
          height: 50,
          child: Text(string),
        )));
  }
}

class AboutPage extends StatelessWidget {
  final String message;
  const AboutPage({required this.message, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DetailPage'),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop("AboutPage_$message");
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Center(
            child: SizedBox(
          height: 50,
          child: Text(message),
        )));
  }
}

class SettingPage extends StatelessWidget {
  final String message;
  const SettingPage({required this.message, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SettingPage'),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop("SettingPage_$message");
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Center(
            child: SizedBox(
          height: 50,
          child: Text(message),
        )));
  }
}

class UnkonwnPage extends StatelessWidget {
  const UnkonwnPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UnkonwnPage'),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop("UnkonwnPage");
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: const Center(
            child: SizedBox(
          height: 50,
          child: Text('UnkownPage'),
        )));
  }
}


// class TextAndButton extends StatelessWidget {
//   final String message;
//   final VoidCallback onPressed;
//   const TextAndButton(
//       {required this.message, required VoidCallback onPressed, super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         TextButton(onPressed: onPressed, child: const Text('Tap商品详情')),
//         Text(message.toString()),
//       ],
//     );
//   }
// }


