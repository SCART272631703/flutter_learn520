//1. • 继承（关键字 extends)
// • 混⼊ mixins (关键字 width)
// • 接⼝实现（关键字 implements）
// 这三种关系有可能同时存在，但是有先后顺序
// 优先级：
// extends -> with -> implements
// dart中的继承规则：
// • ⼦类使⽤extends关键词来继承⽗类
// • ⼦类会继承⽗类⾥⾯可⻅的属性和⽅法 但是不会继承构造函数
// • ⼦类能复写⽗类的⽅法 getter和setter
// • ⼦类重写超类的⽅法，要⽤@override
// • ⼦类调⽤超类的⽅法，要⽤super
// • ⼦类可以继承⽗类的⾮私有变量

// class Person {
//   //公有变量
//   String name;
//   num age;
//   //私有变量
//   final String _gender = '男';
//   //类名构造函数
//   Person(this.name, this.age);
//   work() {
//     print("$name,$_gender在学习...");
//   }
// }

// class Student extends Person {
//   Student(super.name, super.age);
//   run() {
//     print('run');
//     work();
//   }
// }

// main() {
//   Student student =  Student("张三", 16);
//   student.run();
// }

//2. 覆写⽅法work:

// class Person {
//   //公有变量
//   String name;
//   num age;
//   //私有变量
//   final String _gender = '男';
//   //类名构造函数
//   Person(this.name, this.age);
//   work() {
//     print("$name, $_gender, $age 在学习...");
//   }
// }

// class Student extends Person {
//   String school = "清华⼤学";
//   Student(super.name, super.age);
//   run() {
//     print('run');
//     work();
//   }

//   @override
//   work() {
//     print("${super.name} 在 $school 学习");
//   }
// }

// main() {
//   Student student = Student("张三", 16);
//   student.run();
// }

// 3.混合mixins（with）
// • Mixin 是复⽤类代码的⼀种途径， 复⽤的类可以在不同层级，之间可以不存在继承关系。
// • 通过 with 后⾯跟⼀个或多个混⼊的名称，来 使⽤ Mixin通过创建⼀个继承⾃ Object
//  且没有构造函数的类，来实现 ⼀个 Mixin 。
// 如果 Mixin 不希望作为常规类被使⽤，使⽤关键字 mixin 替换 class 作为mixins的类
// 只能继承⾃Object，不能继承其他类
// • 作为mixins的类不能有构造函数
// • ⼀个类可以mixins多个mixins类
// • mixins绝不是继承，也不是接⼝，⽽是⼀种全新的特性

// mixin Family {
//   late String address;
//   late String house;
//   void setFamilyInfo(String address, String house) {
//     this.address = address;
//     this.house = house;
//   }

//   getAddress() {
//     return address;
//   }
// }

// class Person {
//   //公有变量
//   String name;
//   num age;
//   //私有变量
//   final String _gender = '男';
//   //类名构造函数
//   Person(this.name, this.age);
//   work() {
//     print("$name,$_gender在学习...");
//   }
// }

// class Student extends Person with Family {
//   String school = "清华⼤学";
//   Student(super.name, super.age);
//   run() {
//     setFamilyInfo("北京", "明天第⼀城");
//     print('run');
//     work();
//   }

//   @override
//   work() {
//     String address = getAddress();
//     print("${super.name}的家在$address在 $school 学习");
//   }
// }

// main() {
//   Student student = Student("张三", 16);
//   student.run();
// }

// // 4.mixins有优先级顺序

// mixin A {
//   run() {
//     print("run A");
//   }
// }

// mixin B {
//   run() {
//     print("run B");
//   }
// }

// class C {
//   run() {
//     print("run C");
//   }
// }

// class Test extends C with A, B {}

// main() {
//   Test test =  Test();
//   test.run();
// }

// // 打印结果：run B
// class Test extends C with A {}
// main() {
//  Test test = Test();
//  test.run();
// }

// // 打印结果： run A

// // 如果 Test类中覆写了⽗类C的run⽅法：
// class Test extends C with A {
//  @override
//  run() {
//  print("run Test");
//  }
// }
// main() {
//  Test test = new Test();
//  test.run();
// }

// // 打印结果： run Test

// // 结论：
// // 如果继承类、混合类中有相同的⽅法或变量，混合类会覆盖继承类的⽅法或变量，
// // 后混合的会覆盖先混合的⽅法或变量。这个过程叫做mixins的线性化，具体过程：
// // • 如果当前使⽤类重写了该⽅法，就会调⽤当前类中的⽅法。
// // • 如果当前使⽤类没有重写了该⽅法，则会调⽤距离with关键字最远类中的⽅法。

// // 5.with on 的⽤法
// // mixins不能继承于除Object之外的其他类，如果我们确实有继承的需要怎么办呢？
// // Dart引⼊了⼀个关键字on
// // 指定只有某些类型可以使⽤的 Mixin - ⽐如， Mixin 可以调⽤
// // Mixin ⾃身没有定义的⽅法 - 使⽤ on 来指定可以使⽤ Mixin 的⽗类类型
// // 如果我们⽤on关键字限定了mixin ，那么这个mixin 只能适⽤于on后⾯限定的类的⼦类
// class A {
//   void printInfo() {
//     print("print A");
//   }
// }

// mixin B on A {}

// class C with B {}

// void main(List<String> args) {
//   C c = C();
//   c.printInfo();
// }
// // 这种情况C类是会报错的，报错信息：'B' can't be mixed onto 'Object' because 'Object' doesn't
// // implement 'A'.
// // 需要将C类继承于A类, 如下：
// class A {
//   void printInfo() {
//     print("print A");
//   }
// }

// mixin B on A {}

// class C extends A with B {}

// void main(List<String> args) {
//   C c = C();
//   c.printInfo();
// }
// // 报错消失

// 6.接⼝实现(implements)
// Dart是没有interface的，但是Dart中的每个类都是⼀个隐式
// 的接⼝，这个接⼝包含类⾥的所有成员变量，以及定义的⽅
// 法。如果有⼀个类 A,你想让类B拥有A的API，但⼜不想拥
// 有A⾥的实现，那么你就应该把A当做接⼝，类B implements 类A.
// 所以在Dart中:class 就是 interface
// • 当class被当做interface⽤时，类前面要加abstract，class中的⽅法就是接⼝
// 的⽅法，需要在⼦类⾥重新实现，在⼦类实现的时候要加@override
// • class中的成员变量也需要在⼦类⾥重新实现。在成员变量前加@override
// abstract class A {
//   late String name;
//   printA();
// }

// abstract class B {
//   printB();
// }

// class C implements A, B {
//   @override
//   late String name;
//   @override
//   printA() {
//     print('printA');
//   }

//   @override
//   printB() {
//     // TODO: implement printB
//     return null;
//   }
// }

// void main() {
//   C c = C();
//   c.printA();
// }
