
// Flutter编译模式
// 在Android和iOS中，应⽤程序运⾏分为debug和release模式，分别对应调试阶段和发布阶段；

// 在Flutter中，应⽤程序分为以下三种模式
// 1.debug
// 2.profile  // 轮廓，侧面
// 3.release

// 下⾯我们就聊⼀下三种模式的区别和应⽤；
// ⼀. Flutter编译模式
// 1.1. debug模式
// 在 Debug 模式下，app 可以被安装在真机、模拟器、仿真器上进⾏调试。

// Debug 模式有如下特点：
// • 断⾔是开启的（Assertions）
// • 服务扩展是开启的（Service extension）
// • 这个可以从runApp的源码查看
// • runApp -> WidgetsFlutterBinding -> initServiceExtensions
// • 开启调试，类似于DevTools的⼯具可以连接到应⽤程序的进程中
// • 针对快速开发和运⾏周期进⾏了编译优化（但不是针对执⾏速度、⼆进制⽂件⼤⼩或者部署）
// • ⽐如Dart是JIT模式（Just In Time，即时编译，也可以理解成边运⾏边编译）
// 默认情况下，运⾏ flutter run 会使⽤ Debug 模式，点击Android Studio run按钮，
// 也是debug模式

// 下⾯的情况会出现在Debug 模式下：
// • 热重载（Hot Reload）功能仅能在调试模式下运⾏；
// • 仿真器和模拟器仅能在调试模式下运⾏；
// • 在debug模式下，应⽤可能会出现掉帧或者卡顿现象；

// 1.2. release模式
// 当我们要发布应⽤程序时，总是希望最⼤化的优化性能和应⽤程序所占据的空间。
// 在 Release 模式下是不⽀持模拟器和仿真器的，只能在真机上运⾏。

// Release 模式有如下特点：
// • 断⾔是⽆效的
// • 服务扩展是⽆效的
// • debugging是⽆效的
// • 编译针对快速启动、快速执⾏和⼩的 package 的⼤⼩进⾏了优化
// • ⽐如Dart是AOT模式（Ahead Of Time，预先编译）

// flutter run --release 命令会使⽤ Release 模式来进⾏编
// 译，也可以给Android Studio进⾏配置：
// 如果继续运⾏在模拟器上：
// 1.3. profile模式
// profile模式和release模式类似，但是会保留⼀些信息⽅便
// 我们对性能进⾏检测。
// profile模式有如下特点：
// • 保留了⼀些扩展是开启的；
// • DevTools的⼯具可以连接到应⽤程序的进程中；
// Profile模式最重要的作⽤就是可以利⽤DevTools来测试应⽤的性能；

// ⼆. 开发中模式区分
// 在开发中，我们可能想要对debug和release模式进⾏区分，根据不同的模式进⾏不同的相关设置：
// • ⽐如⽹络请求的baseURL'如何进⾏区分呢？常⻅的有两种⽅式：
// • 通过assert断⾔，因为在release模式下断⾔是⽆效的
// • 通过kReleaseMode常量来区分通过断⾔assert来区分：
// • 因为assert要求我们必须传⼊⼀个bool值，所以我们使⽤了⼀个⽴即执⾏函数
// String baseURL = "production baseURL";
// assert(() {
//  baseURL = "development baseURL";
//  return true;
// }());
// 通过kReleaseMode常量来区分
// String baseURL = kReleaseMode ? "production baseURL": 
// "development baseURL";
// 当然，上⾯只是针对baseURL来进⾏了区分，开发中如果有多个属性需要区分呢？
// • 可以封装⼀个Config的类，通过InheritedWidget来进⾏共享即可
// • ⼤家可以利⽤之前学习过的InheritedWidget来⾃⾏封装