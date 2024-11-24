import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 1.ChangeNotifier：真正数据（状态）存放的地⽅
// 2.ChangeNotifierProvider：Widget树中提供数据（状态）的地⽅，会在其中创建对应的ChangeNotifier
// 3.Consumer：Widget树中需要使⽤数据（状态）的地⽅
// 将ChangeNotifierProvider放到了顶层，这样⽅便在整个应⽤的任何地⽅可以使⽤CounterProvider
// Consumer是否是最好的选择呢？并不是，它也会存在弊端
// • ⽐如当点击了floatingActionButton时，我们在代码的两处分别打印它们的builder是否会重新调⽤；
// • 我们会发现只要点击了floatingActionButton，两个位置都会被重新builder；
// • 但是floatingActionButton的位置有重新build的必要吗？没有，因为它是否在操作数据，并没有展示；
// • 如何可以做到让它不要重新build了？使⽤Selector来代替Consumer
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CounterNotifier(),
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
// 引⼊位置⼀：在body中使⽤Consumer，Consumer需要传⼊⼀个builder回调函数，
// 当数据发⽣变化时，就会通知依赖数据的Consumer重新调⽤builder⽅法来构                                                            建；
// 因为Provider是基于InheritedWidget，所以我们在使⽤ChangeNotifier中的数据时，
// 我们可以通过Provider.of的⽅式来使⽤，
// Text("当前计数:$
// {Provider.of<CounterProvider>(context).counter}",
//  style: TextStyle(fontSize: 30, color: Colors.purple),
// ),
// 我们会发现很明显上⾯的代码会更加简洁，那么开发中是否要选择上⾯这种⽅式呢？
// 答案是否定的，更多时候我们还是要选择Consumer的⽅式。为什么呢？因为Consumer在刷新整个Widget树时，
// 会尽可能少的rebuild Widget。
      body: Center(
        child: Consumer<CounterNotifier>(builder: (ctx, counterPro, child) {
          debugPrint('------ HYHomePage CounterProvider build -------');
          return Text(
            // "当前计数:${Provider.of<CounterNotifier>(context).counter}",
             "当前计数:${counterPro.counter}",
            style: const TextStyle(fontSize: 20, color: Colors.red),
            //invoke 祈求，乞灵
          );
        }),
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

// 1.我们需要⼀个ChangeNotifier来保存我们的状态，所以创建它这⾥我们可以使⽤继承⾃ChangeNotifier，也可以使⽤
// 混⼊，这取决于概率是否需要继承⾃其它的类我们使⽤⼀个私有的_counter，并且提供了getter和setter
// 2.在setter中我们监听到_counter的改变，就调⽤notifyListeners⽅法，通知所有的Consumer进⾏更新
class CounterNotifier extends ChangeNotifier {
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
    debugPrint('------ SecondPage build -------');
    return Scaffold(
        appBar: AppBar(
          title: const Text("第⼆个⻚⾯"),
        ),
// 引⼊位置⼆：在floatingActionButton中使⽤Consumer，当点击按钮时，修改CounterNotifier中的counter数据；
        floatingActionButton: Selector<CounterNotifier, CounterNotifier>(
          builder: (context, value, child) {
            debugPrint('------ SecondPage floatingActionButton build -------');
            return FloatingActionButton(onPressed: () => value.counter++);
          },
          selector: (context, privider) => privider,
          shouldRebuild: (previous, next) => false,
          child: const Icon(Icons.add),
        )
        // Consumer<CounterNotifier>(
        //   builder: (ctx, counterPro, child) {
        //     return FloatingActionButton(
        //       child: child,
        //       onPressed: () {
        //         counterPro.counter += 1;
        //       },
        //     );
        //   },
        //   child: const Icon(Icons.add),
        // ),

        );
  }
}
// 参数⼀：context，每个build⽅法都会有上下⽂，⽬的是知道当前树的位置
// 参数⼆：ChangeNotifier对应的实例，也是我们在builder函数中主要使⽤的对象
// 参数三：child，⽬的是进⾏优化，如果builder下⾯有⼀颗庞⼤的⼦树，当模型发⽣改变的时候，我们并不希
// 望重新build这颗⼦树，那么就可以将这颗⼦树放到Consumer的child中，在这⾥直接引⼊即可（注意我案
// 例中的Icon所放的位置）
