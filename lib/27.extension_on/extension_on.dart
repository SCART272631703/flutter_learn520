// class StringExt extension on String{

// 1. 使⽤关键字extension ... on为String定义⼀个扩展类
// 2. 在为扩展类添加⼀个 新的⽅法
// 3. String类型对象调⽤这个扩展的⽅法
extension StringExt on String {
  int add(int x, int y) {
    return x + y;
  }
}

void main(List<String> args) {
  String str = 'abc';
  int result = str.add(3, 7);
  print(result.toString());
}
