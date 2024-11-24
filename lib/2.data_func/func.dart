// 1.位置可选参数，可选参数必须有默认值
// test1() {
//   printInfo2(String name, [int age = 10, double height = 13]) {
//     print('name=$name age=$age height=$height');
//   }

// // 调⽤printInfo2函数
//   printInfo2('why'); // name=why age=null height=null
//   printInfo2('why', 18); // name=why age=18 height=null
//   printInfo2('why', 18, 1.88); // name=why age=18 height=1.88
// }

// // 2.命名可选参数，可选参数必须有默认值
// test2() {
//   printInfo1(String name, {int age = 10, double height = 13}) {
//     print('name=$name age=$age height=$height');
//   }

// // 调⽤printInfo1函数
//   printInfo1('why'); // name=why age=null height=null
//   printInfo1('why', age: 18); // name=why age=18 height=null
//   printInfo1('why', age: 18, height: 1.88); // name=why age=18 height=1.88
//   printInfo1('why', height: 1.88); // name=why age=null
// }

// 3.命名可选参数, 可以指定某个参数是必传的(使⽤required)
// test3() {
//   printInfo3(String name,
//       {int age = 10, double height = 13, required String address}) {
//     print('name=$name age=$age height=$height address=$address');
//   }

//   printInfo3('why', address: 'sdfksdj');
// }

// //4.函数
// // 4.函数作为另一个函数的参数和返回值
// test4() {
// // 1.定义⼀个函数
//   foo(String name) {
//     print('传⼊的name:$name');
//   }

// // 2.将函数作为另外⼀个函数的参数
//   test(Function func) {
//     func('coderwhy');
//   }

// // 3.将函数作为另⼀个函数的返回值
//   getFunc() {
//     return foo;
//   }

//   // 1.将函数赋值给⼀个变量
//   var bar = foo;
//   print(bar);
//   // 2.将函数作为另⼀个函数的参数
//   test(foo);
//   // 3.将函数作为另⼀个函数的返回值
//   var func = getFunc();
//   func('kobe');
// }

// //5.匿名函数（闭包）
void test5() {
  // 1.定义数组
  var movies = ['盗梦空间', '星际穿越', '少年派', '⼤话⻄游'];
  // 2.使⽤forEach遍历: 有名字的函数
  printElement(item) {
    print(item);
  }

  movies.forEach(printElement);

  // 3.使⽤forEach遍历: 匿名函数
  movies.forEach((item) {
    print(item);
  });
  movies.forEach((item) => print(item));
}

// //6. 词法闭包，返回值是一个闭包。
// // 所有函数都返回⼀个值。如果没有指定返回值，则语句返回null;隐式附加到函数体。
// void test6() {
//   makeAdder(num addBy) {
//     return (num i) {
//       return i + addBy;
//     };
//   }

//   var adder2 = makeAdder(2);
//   print(adder2(10)); // 12
//   print(adder2(6)); // 8

//   var adder5 = makeAdder(5);
//   print(adder5(10)); // 15
//   print(adder5(6)); // 11
// }

// main(List<String> args) {
//   test1();
//   test2();
//   test3();
//   test4();
//   test5();
//   test6();
// }
