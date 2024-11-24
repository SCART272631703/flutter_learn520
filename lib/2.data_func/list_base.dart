// 一、数组的定义

// 1、定义固定类型数组

void main(List<String> args) {
  final numbers = <int>[1, 2, 3];
  // unmodifiable 不可修改的
  // final unmodifiableList = List.unmodifiable(numbers); // [1, 2, 3]
  // unmodifiableList[1] = 87; // Throws.

  final growableList =
      List<int>.generate(3, (int index) => index * index, growable: true);
  print(growableList); // [0, 1, 4]

  final fixedLengthList =
      List<int>.generate(3, (int index) => index * index, growable: false);
  print(fixedLengthList); // [0, 1, 4]
  // fixedLengthList.add(5);

  final numberst = <int>[1, 2, 3];
  final listOf = List<num>.of(numberst);
  print(listOf); // [1, 2, 3]

  final numberss = <num>[1, 2, 3];
  final listFrom = List<int>.from(numberss);
  print(listFrom); // [1, 2, 3]

// 浅拷贝：拷贝指针
// 深拷贝：拷贝一份新的对象
// 浅拷贝 出现的问题：操作一个数组另一个数组也发生改变
  List list16 = ['1', '2', '3', '4', '5'];
  List copyList = list16;
  copyList[0] = 'abc';
  print(list16);

  ///打印：  [abc,2,3,4,5]
  print(copyList);

  ///打印：  [abc,2,3,4,5]
// 上面问题解决办法：使用 深拷贝 list.from()

  List list17 = ['1', '2', '3', '4', '5'];
  List copyList1 = List.from(list17);
  copyList1[0] = 'abc';
  print(list17);

  ///打印：  [1,2,3,4,5]
  print(copyList1);

  ///打印：  [abc,2,3,4,5]

  //创建一个固定长度的数组
  var list15 = List.filled(2, "");
  print(list15);

// 3、定义混合类型数组
  var listaa = List<int>.empty();
  var list3 = List.empty();
  // list3.add(2);
  // list3.add('value');
  print(list3); // [2, 'value']

// 二、数组的常用属性

// 1、获取数组长度 - length

  var list1 = [1, 2, 3, 4];
  print(list1.length); // 4

// 2、获取数组第一个元素 - first

  var list2 = [1, 2, 3, 4];
  print(list2.first); // 1

// 3、获取数组最后一个元素 - last

  var list4 = [1, 2, 3, 4];
  print(list4.last); // 4

// 3、获取倒序迭代器 - reversed

  var list5 = [1, 2, 3, 4];
  print(list5.reversed); // (4, 3, 2, 1)

// 4、判断数组是否为空 - isEmpty

  var list6 = [1, 2, 3, 4];
  print(list6.isEmpty); // false

// 5、判断数组是否为非空 - isNotEmpty

  var list7 = [1, 2, 3, 4];
  print(list7.isNotEmpty); // true

// 三、数组的常用方法

// 1、添加元素 - add

  var list = [];
  list.add(1);
  print(list); // [1]

// 2、批量添加 - addAll

  var list9 = [1, 2, 3, 4];
  var lista = [0, 20, 40];
  lista.addAll(list9);
  print(lista); // [1, 2, 3, 4, 0, 20, 40]

// 3、指定位置添加 - insert

  var listb = [1, 2, 3, 4];
  listb.insert(2, 90);
  print(listb); // [1, 2, 90, 3, 4]

// 4、指定位置批量添加 - insertAll

  var listc = [1, 2, 3, 4];
  var listd = [0, 20, 40];
  listd.insertAll(2, listc);
  print(listd); // [1, 2, 0, 20, 40, 3, 4]

// 5、删除指定值 - remove

  var liste = [1, 2, 6, 4];
  liste.remove(6);
  print(liste); // [1, 2, 4]

// 6、删除指定索引 - removeAt

  var listf = [1, 2, 6, 4];
  listf.removeAt(2);
  print(listf); // [1, 2, 4]

// 7、删除指定范围 - removeRange

  var listg = [1, 2, 6, 4];
  listg.removeRange(2, 4);
  print(listg); // [1, 2]

// 8、删除最后一个 - removeLast

  var listh = [1, 2, 6, 4];
  listh.removeLast();
  print(listh); // [1, 2, 6]

// 9、删除符合条件的所有元素 - removeWhere

  var listi = [1, 2, 6, 4, 6];
// 删除大于3的元素
  listi.removeWhere((v) => v > 3);
  print(listi); // [1, 2]

// 10、删除所有元素 - clear

  var listj = [1, 2, 6, 4, 6];
  listj.clear();
  print(listj); // []

// 11、修改数组中某区间元素为指定值 - setRange

  var listk = [1, 2, 6, 4, 6];
  listk.setRange(1, 4, [9, 9, 9]); // 将索引1到4的值修改为9
  print(listk); // [1, 9, 9, 9, 6]

// 12、修改指定索引后的数组值 - setAll

  var listl = [1, 2, 6, 4, 6];
  listl.setAll(2, [2, 4, 5]); // 设置索引为2开始的后面3位数分别为2，4，5
  print(listl); // [1, 2, 2, 4, 5]

// 13、修改指定索引后的数组值 - setAll

  var listm = [1, 2, 6, 4, 6];
  listm.setAll(2, [2, 4, 5]); // 设置索引为2开始的后面3位数分别为2，4，5
  print(listm); // [1, 2, 2, 4, 5]

// 13、替换 - replaceRange

  var listn = [1, 2, 6, 4, 6];
  listn.replaceRange(0, 4, [3]); // 将索引从0-4的元素替换成3
  print(listn); // [3, 6]

// 14、将指定区间替换成某个固定值- fillRange

  var listo = [1, 2, 6, 4, 6];
  listo.fillRange(2, 4, 1); // 将区间2到4的元素替换成数值1
  print(listo); // [1, 2, 1, 1, 6]

// 15、获取某个区间的值- getRange

// 返回迭代器
  var listp = [1, 2, 6, 4, 6];
  print(listp.getRange(2, 4)); // 返回Iterable (6, 4)

// 16、查询指定区间的值- sublist

// 返回迭代器
  var listq = [1, 2, 6, 4, 6];
  print(listq.sublist(2)); // [6, 4, 6] ， 返回从索引2开始的所有数据
  print(listq.sublist(2, 4)); // [6, 4]， 返回索引从2到4的数据

// 17、判断数组内是否有满足条件的元素- any

  var listr = [3, 2, 6, 4, 6];
// 数组中是否有大于2的元素
  print(listr.any((v) => v > 2)); // true
// 数组中是否有大于6的元素
  print(listr.any((v) => v > 6)); // false

// 18、判断数组所有元素是否都满足设定条件 - every

  var lists = [3, 2, 6, 4, 6];
// 数组中所有元素是否都大于1
  print(lists.every((v) => v > 1)); // true
// 数组中所有元素是否都大于2
  print(lists.every((v) => v > 2)); // false

// 19、判断数组是否包含某个元素 - contains

  var listt = [3, 2, 6, 4, 6];
// 数组中是否包含3
  print(listt.contains(3)); // true
// 数组中是否包含1
  print(listt.contains(1)); // false

// 20、获取满足条件的第一个元素 - firstWhere

  var listu = [3, 2, 3, 6, 4, 3];
// 获取最后一个大于2的元素
  print(listu.lastWhere((v) => v > 2)); // 3

// 如果未查找到所制定条件的元素，进入orElse参数
  listu.firstWhere((v) => v > 6, orElse: () {
    int? a = 3;
    return a;
  });

// 21、获取满足条件的最后一个元素 - lastWhere

  var listv = [3, 2, 6, 4, 6];
// 获取最后一个大于4的元素
  print(listv.lastWhere((v) => v > 4)); // 6

// 如果未查找到所制定条件的元素，进入orElse参数
  listv.firstWhere((v) => v > 6, orElse: () => 3);

// 22、从制定位置开始，获取满足条件的第一个元素的索引 - indexWhere

  var listw = [3, 2, 6, 4, 6];
// 查询第一个大于4的元素索引值
  print(listw.indexWhere((v) => v > 4)); // 2
// 从索引3开始，查询第一个大于4的元素索引值
  print(listw.indexWhere((v) => v > 4, 3)); // 4
// 从索引3开始，查询第一个大于9的元素索引值
// 若不存在，返回-1
  print(listw.indexWhere((v) => v > 9, 3)); // -1

// 23、获取满足条件的最后一个元素的索引(倒叙查询) - lastIndexWhere

  var listx = [3, 2, 6, 4, 6];
// 获取最后一个大于4的元素索引值
  print(listx.lastIndexWhere((v) => v > 2)); // 4
// 从索引2开始，查询最后一个大于4的元素索引值
  print(listx.lastIndexWhere((v) => v > 3, 3)); // 2
// 如果没有，返回-1
  print(listx.lastIndexWhere((v) => v > 9)); // -1

// 24、从指定位置开始，获取指定值的索引 - indexOf

  var listy = [3, 2, 6, 4, 6];
// 从索引3开始，获取6第一次出现时的索引值，如果不存在，返回 -1
  print(listy.indexOf(6, 3)); // 4
  print(listy.indexOf(6)); // 2

// 25、从指定位置开始，倒叙获取指定值的索引 - lastIndexOf

  var listz = [3, 2, 6, 4, 6];
// 从索引3开始，获取6第一次出现时的索引值，如果不存在，返回 -1
  var list11 = [3, 2, 6, 4, 6];
  print(listz.lastIndexOf(6, 3)); // 4
  print(list11.lastIndexOf(6)); // 2
  print(list11.lastIndexOf(7)); // -1

// 26、获取唯一元素 - singleWhere

  var list12 = [3, 2, 6, 4, 6];
// 获取大于6的唯一元素，不存在该元素，执行orElse
  print(list12.singleWhere((v) => v > 6, orElse: () {
    print(' --- ');
    return 0;
  })); // ---

// 获取等于2的唯一元素，存在，返回2
  print(list12.singleWhere((v) => v == 2, orElse: () {
    print(' --- ');
    return 0;
  })); // 2

// 获取等于6的唯一元素，存在该元素，但是出现次数不唯一，不会执行orElse，直接抛出错误，进入catch
  // print(list12.singleWhere((v) => v == 6, orElse: () {
  //   print(' --- ');
  //   return 0;
  // })); // error

// 27、将数组用指定字符拼接成字符串 - join

  var list13 = [3, 2, 6, 4, 6];
// 将数组转换为用&拼接的字符串
  print(list13.join('&')); // 3&2&6&4&6

// 28、数组去重 - toSet

  var list14 = [3, 2, 6, 4, 6];
  print(list14.toSet()); // {3, 2, 6, 4}

// 29、数组遍历 - forEach

  var listac = [3, 2, 6, 4, 6];
  listac.forEach((element) {
    // element 为list内的每个元素
    print(element);
    /*
       3
       2
       6
       4
       6
     */
  });

// 30、按指定条件返回Iterable - map

  var listad = [3, 2, 6, 4, 6];
// 将list所有元素加1并返回Iterable
  var x = listad.map((e) {
    return e + 1;
  });
  print(x); //(4, 3, 7, 5, 7)
// 将list所有元素与4比较并返回boolean Iterable
  var y = listad.map((e) {
    return e > 4;
  });
  print(y); //(false, false, true, false, true)

// 31、累加器 - reduce

  var listaaa = [3, 2, 6, 4, 6];
// 将每次返回值作为value循环执行。最终返回最后一次执行值
  var x18 = listaaa.reduce((value, element) {
    print('value: $value - element: $element');
    /**
    每次的执行结果
    value: 3 - element: 2
    value: 5 - element: 6
    value: 11 - element: 4
    value: 15 - element: 6
  */
    return value + element;
  });
  print('x18: $x18'); // x: 21

// 32、排序 - sort

  var list19 = [3, 2, 6, 4, 6];
// 按回调中的return结果正负数来排序
// a - b 为升序， b - a为降序
  list.sort((a, b) {
    return a - b;
  });
  print(list19); // [6, 6, 4, 3, 2]
}
