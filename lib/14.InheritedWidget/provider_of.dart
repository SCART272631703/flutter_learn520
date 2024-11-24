import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 因为Provider是基于InheritedWidget，所以我们在使⽤ChangeNotifier中的数据时，
// 我们可以通过Provider.of的⽅式来使⽤，更多时候我们还是要选择Consumer的⽅式。
// 为什么呢？因为Consumer在刷新整个Widget树时，会尽可能少的rebuild Widget。

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CounterProvider(),
    child: const MyApp(),
  ));
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
      home: const HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  const HYHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint('------ HYHomePage Widget build -------');
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表测试"),
      ),
      body: Center(
        child: Text(
          "当前计数:${Provider.of<CounterProvider>(context).counter}",
          style: const TextStyle(fontSize: 30, color: Colors.purple),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pushSecondPage(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void pushSecondPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SecondPage()));
  }
}

class CounterProvider extends ChangeNotifier {
  int _counter = 100;
  int get counter {
    return _counter;
  }

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint('------ SecondPage Widget build -------');
    return Scaffold(
        appBar: AppBar(
          title: const Text("第⼆个⻚⾯"),
        ),
        floatingActionButton:

            // Consumer<CounterProvider>(
            //   builder: (ctx, counterPro, child) {
            //     debugPrint('------ SecondPage floatingActionButton build -------');
            //     return FloatingActionButton(
            //       child: child,
            //       onPressed: () {
            //         counterPro.counter += 1;
            //       },
            //     );
            //   },
            //   child: const Icon(Icons.add),
            // ),
            FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Provider.of<CounterProvider>(context).counter++;
          },
        ));
  }
}
