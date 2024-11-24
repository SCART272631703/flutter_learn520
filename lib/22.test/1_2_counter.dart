// ⼀. 单元测试
// 单元测试是针对⼀个函数或者类进⾏测试
// 1.1. 添加测试依赖
// 将 test 或者 flutter_test加⼊依赖⽂件，默认创建的Flutter
// 程序已经有了依赖：
// • Test 包提供了编写测试所需要的核⼼功能
// dev_dependencies:
//  flutter_test:
//  sdk: flutter
// 1.2. 创建需要测试的类
// 单元测试通常是测试⼀个函数或者类，这个函数或者类被称之为是⼀个单元。
// 在这⾥，我们按照官⽅示例，创建⼀个简单的Counter类来演示：

class Counter {
 int value = 0;
 void increment() => value++;
 void decrement() => value--;
}