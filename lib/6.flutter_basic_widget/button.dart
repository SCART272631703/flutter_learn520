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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            debugPrint("FloatingActionButton Click");
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("HelloWorld"),
        ),
        body: const MyHomeBody(),
      ),
    );
  }
}

class MyHomeBody extends StatelessWidget {
  const MyHomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "普通样式按钮ButtonStyleButton",
          textAlign: TextAlign.center, // 所有内容都居中对⻬
          style: TextStyle(fontSize: 10, color: Colors.purple),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 30,
            ),
            TextButton(
              child: const Text("TextButton"),
              onPressed: () {
                debugPrint("TextButton Click");
              },
            ),
            ElevatedButton(
              child: const Text("ElevatedButton"),
              onPressed: () {
                debugPrint("ElevatedButton Click");
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 30,
            ),
            FilledButton(
              child: const Text("OutlineButton"),
              onPressed: () {
                debugPrint("FilledButton Click");
              },
            ),
            OutlinedButton(
              child: const Text("ElevatedButton"),
              onPressed: () {
                debugPrint("ElevatedButton Click");
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "自定义TextButton",
          textAlign: TextAlign.center, // 所有内容都居中对⻬
          style: TextStyle(fontSize: 10, color: Colors.purple),
        ),
        TextButton(
          onPressed: () {
            debugPrint("自定义TextButton Click");
          },
          style: 
          
          const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
            // elevation 提拔，提升, ⽤于控制阴影的⼤⼩
            elevation: WidgetStatePropertyAll(10.0),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                // 圆形矩形边框
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side: BorderSide(color: Colors.black, width: 0.5),
              ),
            ),
          ),
          
          child: const Text(
            'CustomButton',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "图标按钮IconButton:",
          textAlign: TextAlign.center, // 所有内容都居中对⻬
          style: TextStyle(fontSize: 10, color: Colors.purple),
        ),
        IconButton(
          onPressed: () {
            debugPrint("IconButton Click");
          },
          selectedIcon: const Icon(Icons.person_outline),
          // isSelected: iconButtonIsSelected,
          color: Colors.green,
          icon: const Icon(Icons.person),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "FloatingActionButton:",
          textAlign: TextAlign.center, // 所有内容都居中对⻬
          style: TextStyle(fontSize: 10, color: Colors.purple),
        ),
        FloatingActionButton(
          backgroundColor: Colors.red,
          foregroundColor: Colors.green,
          onPressed: () {
            debugPrint("FloatingActionButton Click");
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "ActionButton:",
          textAlign: TextAlign.center, // 所有内容都居中对⻬
          style: TextStyle(fontSize: 10, color: Colors.purple),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BackButton(
              onPressed: () {
                debugPrint("BackButton Click");
              },
            ),
            CloseButton(
              onPressed: () {
                debugPrint("CloseButton Click");
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerButton(
              onPressed: () {
                debugPrint("DrawerButton Click");
              },
            ),
            EndDrawerButton(
              onPressed: () {
                debugPrint("EndDrawerButton Click");
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "ToggleButtons:",
          textAlign: TextAlign.center, // 所有内容都居中对⻬
          style: TextStyle(fontSize: 10, color: Colors.purple),
        ),
        ToggleButtons(
          //ToggleButtons 转换键，切换键
          isSelected: const [true, false, false],
          onPressed: (index) {
            // 当按钮被按下时执⾏的操作
          },
          children: List.of(<Widget>[
            Container(width: 20.0, height: 20.0, color: Colors.red),
            Container(width: 20.0, height: 20.0, color: Colors.green),
            Container(width: 20.0, height: 20.0, color: Colors.blue)
          ]),
        ),
        ToggleButtons(
          isSelected: const [true, false, false],
          onPressed: (index) {
            // 当按钮被按下时执⾏的操作
          },
          children: List.of(<Widget>[
            const Text('Small'),
            const Text('Medium'),
            const Text('Large'),
          ]),
        )
      ],
    ));
  }
}
