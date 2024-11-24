//1.const放在赋值语句的右边，可以共享对象，提⾼性能
class Person {
  const Person();
}

test1() {
  const a = const Person();
  const b = const Person();
  print(identical(a, b)); // true
}

// 2.字符串转数字，数字转字符串
test2() {
// 2.1.字符串转数字 parse[pa:z]从语法上分析
  var one = int.parse('111');
  var two = double.parse('12.22');
  print('${one} ${one.runtimeType}'); // 111 int
  print('${two} ${two.runtimeType}'); // 12.22 double

  // 2.2.数字转字符串
  var num1 = 123;
  var num2 = 123.456;
  var num1Str = num1.toString();
  var num2Str = num2.toString();
  var num2StrD = num2.toStringAsFixed(2); // 保留两位⼩数
  print('${num1Str} ${num1Str.runtimeType}'); // 123 String
  print('${num2Str} ${num2Str.runtimeType}'); // 123.456
  print('${num2StrD} ${num2StrD.runtimeType}'); // 123.46
}

//3. Dart中不能判断⾮0即真, 或者⾮空即真
test3() {
  var message = 'Hello Dart';
  // 错误的写法
  // if (message) {
  //   print(message);
  // }
}

//4. 集合的常⻅操作
test4() {
  // 4.1.获取集合的⻓度
  var letters = ['a', 'b', 'c', 'd'];
  var lettersSet = {'a', 'b', 'c', 'd'};
  var infoMap1 = {'name': 'why', 'age': 18};
  print(letters.length);
  print(lettersSet.length);
  print(infoMap1.length);
  // 4.2.添加/删除/包含元素
  List<int> numbers = [1, 2, 3, 4];
  Set<int> numbersSet = {1, 2, 3, 4};
  numbers.add(5);
  numbersSet.add(5);
  print('$numbers $numbersSet');
  numbers.remove(1);
  numbersSet.remove(1);
  print('$numbers $numbersSet');
  print(numbers.contains(2));
  print(numbersSet.contains(2));

// 4.3.Map的操作
// 1.根据key获取value
  print(infoMap1['name']); // why
// 2.获取所有的entries
  print(
      '${infoMap1.entries} ${infoMap1.entries.runtimeType}'); // (MapEntry(name: why), MapEntry(age: 18) MappedIterable<String, MapEntry<String, Object>>
// 3.获取所有的keys
  print(
      '${infoMap1.keys} ${infoMap1.keys.runtimeType}'); // (name, age) _CompactIterable<String>
// 4.获取所有的values
  print(
      '${infoMap1.values} ${infoMap1.values.runtimeType}'); // (why, 18) _CompactIterable<Object>
// 5.判断是否包含某个key或者value
  print(
      '${infoMap1.containsKey('age')} ${infoMap1.containsValue(18)}'); // true true
}

main(List<String> args) {
  // test1();
  // test2();
  // test3();
  test4();
}
