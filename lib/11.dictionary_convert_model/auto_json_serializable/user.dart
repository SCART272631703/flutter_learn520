import 'package:json_annotation/json_annotation.dart';
import 'computer.dart';
// 步骤：
// 1.执行flutter pub add json_serializable   
//      flutter pub add 0build_runner
// 2. 执行该指令是⽣成⼀次JSON序列化的代码
//flutter pub run build_runner build
//或运⾏下⾯的指令：
//会监听⽂件的改变，重新⽣成JSON序列化的代码
// flutter pub run build_runner watch

// 1.这个是之后json_serializable会⾃动帮助我们⽣成的⽂件
part 'user.g.dart';

// 2.注解：告诉json_serializable哪⼀个类需要进⾏转换
@JsonSerializable()
class User {
  String nickname;
  num level;
  // 3.当映射关系不⼀样时，JsonKey可以指定映射关系
  @JsonKey(name: "register_date")
  String registerDate;
  List<String> courses;
  Computer computer;
  // 4.另外，这⾥必须有我们的构造⽅法
  User(this.nickname, this.level, this.registerDate, this.courses, this.computer);
  // 5.需要有对应的⼯⼚构造器,
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  // 6.UserToJson(this)调⽤的该⽅法⽬前会报错，需要json_serializable来⽣
  Map<String, dynamic> toJson() => _$UserToJson(this);
  // 7.toString⽅法不是必须的，是待会⼉进⾏测试的
  @override
  String toString() {
    return 'User{nickname: $nickname, level: $level, registerDate: $registerDate, courses: $courses, computer: $computer}';
  }
}
