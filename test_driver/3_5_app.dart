// test_driver/app.dart ⽂件中增加以下代码：

import 'package:flutter_driver/driver_extension.dart';
import 'package:learn520/main.dart' as app;

void main() {
 // 开启DriverExtension
 enableFlutterDriverExtension();
 // ⼿动调⽤main函数, 启动应⽤程序
 app.main();
} 


