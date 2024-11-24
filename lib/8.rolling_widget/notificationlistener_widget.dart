// 如果我们希望监听什么时候开始滚动，什么时候结束滚动，这个时候我们可以通过NotificationListener。
// • NotificationListener是⼀个Widget，模板参数T是想监听的通知类型，如果省略，则所有类型通知都会被监
// 听，如果指定特定类型，则只有该类型的通知会被监听。
// • NotificationListener需要⼀个onNotification回调函数，⽤于实现监听处理逻辑。
// • 该回调可以返回⼀个布尔值，代表是否阻⽌该事件继续向上冒泡，如果为true时，则冒泡终⽌，事件停⽌向上
// 传播，如果不返回或者返回值为false 时，则冒泡继续。
// 案例: 列表滚动, 并且在中间显示滚动进度

//5.2. NotificationListener
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("HelloWorld"),
        ),
        body: const MyHomeNotificationDemo(),
      ),
    );
  }
}

class MyHomeNotificationDemo extends StatefulWidget {
  const MyHomeNotificationDemo({super.key});
  @override
  State<StatefulWidget> createState() => MyHomeNotificationDemoState();
}

class MyHomeNotificationDemoState extends State<MyHomeNotificationDemo> {
  int _progress = 0;
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        // 1.判断监听事件的类型
        if (notification is ScrollStartNotification) {
          debugPrint("开始滚动.....");
        } else if (notification is ScrollUpdateNotification) {
          // 当前滚动的位置和总⻓度
          final currentPixel = notification.metrics.pixels;
          final totalPixel = notification.metrics.maxScrollExtent;
          double progress = currentPixel / totalPixel;
          setState(() {
            _progress = (progress * 100).toInt();
          });
          debugPrint(
              "正在滚动：${notification.metrics.pixels} - ${notification.metrics.maxScrollExtent}");
        } else if (notification is ScrollEndNotification) {
          debugPrint("结束滚动....");
        }
        return false;
      },
      child: Stack(
        alignment: const Alignment(.9, .9),
        children: <Widget>[
          ListView.builder(
              itemCount: 100,
              itemExtent: 60,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text("item$index"));
              }),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black54,
            child: Text("$_progress%"),
          )
        ],
      ),
    );
  }
}
