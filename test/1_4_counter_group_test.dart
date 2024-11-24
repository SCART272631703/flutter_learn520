
// 1.4. 整合多个测试
// 如果对同⼀个类或函数有多个测试，我们希望它们关联在⼀起进⾏测试，可以使⽤group

// 1.5. 执⾏测试结果
// ⽤ IntelliJ 或 VSCode 执⾏测试IntelliJ 和 VSCode 的 Flutter 插件⽀持执⾏测试。
// ⽤这种⽅式执⾏测试是最好的，因为它可以提供最快的反馈闭环，⽽且还⽀持断点调试。

// • IntelliJ
// 1. 打开⽂件 counter_test.dart
// 2. 选择菜单 Run
// 3. 点击选项 Run 'tests in counter_test.dart'
// 4. 或者，也可以使⽤系统快捷键!

// • VSCode
// 1. 打开⽂件 counter_test.dart
// 2. 选择菜单 Debug
// 3. 点击选项 Start Debugging
// 4. 或者，也可以使⽤系统快捷键!

// 在终端执⾏测试
// 我们也可以打开终端，在⼯程根⽬录输⼊以下命令来执⾏测试：
// flutter test test/counter_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:learn520/22.test/1_2_counter.dart';
void main() {
  group("Counter Test", () {
    test("Counter Default Value", () {
      expect(Counter().value, 0);
    });
    test("Counter Increment test", () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });
    test("Counter Decrement test", () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}
