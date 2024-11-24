// 1.3. 创建测试⽂件
// 我们在test⽬录下（注意：不是lib⽬录下），创建⼀个测试⽂件：counter_test.dart
// • 通常测试代码都会放在该⽬录下，并且测试⽂件不会打包到最终的应⽤程序中；
// • 测试⽂件通常以 _test.dart 命名，这是 test runner 寻找测试⽂件的惯例；
import 'package:flutter_test/flutter_test.dart';
import 'package:learn520/22.test/1_2_counter.dart';

void main() {
  test("Counter Class test", () {
    // 1.创建Counter并且执⾏操作
    final counter = Counter();
    counter.increment();
    // 2.通过expect来监测结果正确与否
    expect(counter.value, 1);
  });
}


