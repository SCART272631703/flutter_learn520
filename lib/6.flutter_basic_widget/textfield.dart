// //4.1.2. TextField的样式以及监听
// import 'package:flutter/material.dart';

// main(List<String> args) {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("HelloWorld"),
//         ),
//         body: const HomeContent(),
//       ),
//     );
//   }
// }

// class HomeContent extends StatelessWidget {
//   const HomeContent({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: const Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[TextFieldDemo()],
//       ),
//     );
//   }
// }

// class TextFieldDemo extends StatefulWidget {
//   const TextFieldDemo({super.key});
//   @override
//   TextFieldDemoState createState() => TextFieldDemoState();
// }

// class TextFieldDemoState extends State<TextFieldDemo> {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: const InputDecoration(
//           icon: Icon(Icons.people),
//           labelText: "username",
//           hintText: "请输⼊⽤户名",
//           border: InputBorder.none,
//           filled: true,
//           fillColor: Colors.lightGreen),
//       onChanged: (value) {
//         debugPrint("onChanged:$value");
//       },
//       onSubmitted: (value) {
//         debugPrint("onSubmitted:$value");
//       },
//     );
//   }
// }
//4.1.3. TextField的controller

// import 'package:flutter/material.dart';

// main(List<String> args) {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("HelloWorld"),
//         ),
//         body: const HomeContent(),
//       ),
//     );
//   }
// }

// class HomeContent extends StatelessWidget {
//   const HomeContent({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: const Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[TextFieldDemo()],
//       ),
//     );
//   }
// }

// class TextFieldDemo extends StatefulWidget {
//   const TextFieldDemo({super.key});
//   @override
//   TextFieldDemoState createState() => TextFieldDemoState();
// }

// class TextFieldDemoState extends State<TextFieldDemo> {
//   final textEditingController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     // 1.设置默认值
//     textEditingController.text = "Hello World";
//     // 2.监听⽂本框
//     textEditingController.addListener(() {
//       debugPrint("textEditingController:${textEditingController.text}");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: const InputDecoration(
//           icon: Icon(Icons.people),
//           labelText: "username",
//           hintText: "请输⼊⽤户名",
//           border: InputBorder.none,
//           filled: true,
//           fillColor: Colors.lightGreen),
//           controller: textEditingController,
//       onChanged: (value) {
//         debugPrint("onChanged:$value");
//       },
//       onSubmitted: (value) {
//         debugPrint("onSubmitted:$value");
//       },
//     );
//   }
// }
//4.2.1. Form表单的基本使⽤
// import 'package:flutter/material.dart';

// main(List<String> args) {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("HelloWorld"),
//         ),
//         body: const HomeContent(),
//       ),
//     );
//   }
// }

// class HomeContent extends StatelessWidget {
//   const HomeContent({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: const Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[FormDemo()],
//       ),
//     );
//   }
// }

// class FormDemo extends StatefulWidget {
//   const FormDemo({super.key});
//   @override
//   FormDemoState createState() => FormDemoState();
// }

// class FormDemoState extends State<FormDemo> {
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       // form 表格
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           TextFormField(
//             decoration: const InputDecoration(
//                 icon: Icon(Icons.people),
//                 labelText: "⽤户名或⼿机号",
//                 hintText: '请输入用户名或手机号'),
//           ),
//           TextFormField(
//             // obscureText 模糊的文本
//             obscureText: true,
//             decoration: const InputDecoration(
//                 icon: Icon(Icons.lock), labelText: "密码", hintText: '请输入密码'),
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           Container(
//             // infinity 无穷大
//             width: double.infinity,
//             height: 44,
//             child: TextButton(
//               style: ButtonStyle(
//                   backgroundColor: WidgetStateProperty.all(Colors.green)),
//               child: const Text(
//                 "注 册",
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//               onPressed: () {
//                 debugPrint("点击了注册按钮");
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

//4.2.2. 保存和获取表单数据
// import 'package:flutter/material.dart';

// main(List<String> args) {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("HelloWorld"),
//         ),
//         body: const HomeContent(),
//       ),
//     );
//   }
// }

// class HomeContent extends StatelessWidget {
//   const HomeContent({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: const Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[FormDemo()],
//       ),
//     );
//   }
// }

// class FormDemo extends StatefulWidget {
//   const FormDemo({super.key});
//   @override
//   FormDemoState createState() => FormDemoState();
// }

// class FormDemoState extends State<FormDemo> {
//   final registerFormKey = GlobalKey<FormState>();
//   String ? username, password;
//   void registerForm() {
//     registerFormKey.currentState?.save();
//     debugPrint("username:$username password:$password");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: registerFormKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           TextFormField(
//             decoration:
//                 const InputDecoration(icon: Icon(Icons.people), labelText: "⽤户名或⼿机号"),
//             onSaved: (value) {
//               username = value;
//             },
//           ),
//           TextFormField(
//             obscureText: true,
//             decoration:
//                 const InputDecoration(icon: Icon(Icons.lock), labelText: "密码"),
//             onSaved: (value) {
//               password = value;
//             },
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           Container(
//             width: double.infinity,
//             height: 44,
//             child:
//             TextButton(
//               style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.green)),
//               onPressed: registerForm,
//               child: const Text(
//                 "注 册",
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


//4.2.3. 验证填写的表单数据，使用validator的回调函数
// import 'package:flutter/material.dart';

// main(List<String> args) {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("HelloWorld"),
//         ),
//         body: const HomeContent(),
//       ),
//     );
//   }
// }

// class HomeContent extends StatelessWidget {
//   const HomeContent({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: const Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[FormDemo()],
//       ),
//     );
//   }
// }

// class FormDemo extends StatefulWidget {
//   const FormDemo({super.key});
//   @override
//   FormDemoState createState() => FormDemoState();
// }

// class FormDemoState extends State<FormDemo> {
//   final registerFormKey = GlobalKey<FormState>();
//   String? username, password;
//   void registerForm() {
//     registerFormKey.currentState?.save();
//     registerFormKey.currentState?.validate(); // validate 使合法化，批准，确认
//     debugPrint("username:$username password:$password");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: registerFormKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           TextFormField(
//             decoration: const InputDecoration(
//                 icon: Icon(Icons.people), labelText: "⽤户名或⼿机号"),
//             onSaved: (value) {
//               username = value;
//             },
//             validator: (value) {
//               if (value == null) {
//                 return null;
//               } else if (value.isEmpty) {
//                 return '账号不能为空';
//               } else {
//                 return null;
//               }
//             },
//           ),
//           TextFormField(
//             obscureText: true,
//             decoration:
//                 const InputDecoration(icon: Icon(Icons.lock), labelText: "密码"),
//             onSaved: (value) {
//               password = value;
//             },
//             validator: (value) {
//               if (value == null) {
//                 return null;
//               } else if (value.isEmpty) {
//                 return '密码不能为空';
//               } else {
//                 return null;
//               }
//             },
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           Container(
//             width: double.infinity,
//             height: 44,
//             child: TextButton(
//               style: const ButtonStyle(
//                   backgroundColor: WidgetStatePropertyAll<Color>(Colors.green)),
//               onPressed: registerForm,
//               child: const Text(
//                 "注 册",
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

//4.2.3. 验证填写的表单数据，TextFormField的属性：autovalidate
// import 'package:flutter/material.dart';

// main(List<String> args) {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("HelloWorld"),
//         ),
//         body: const HomeContent(),
//       ),
//     );
//   }
// }

// class HomeContent extends StatelessWidget {
//   const HomeContent({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: const Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[FormDemo()],
//       ),
//     );
//   }
// }

// class FormDemo extends StatefulWidget {
//   const FormDemo({super.key});
//   @override
//   FormDemoState createState() => FormDemoState();
// }

// class FormDemoState extends State<FormDemo> {
//   final registerFormKey = GlobalKey<FormState>();
//   String? username, password;
//   void registerForm() {
//     registerFormKey.currentState?.save();
//     debugPrint("username:$username password:$password");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: registerFormKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           TextFormField(
//             decoration: const InputDecoration(
//                 icon: Icon(Icons.people), labelText: "⽤户名或⼿机号"),
//             onSaved: (value) {
//               username = value;
//             },
//             autovalidateMode: AutovalidateMode.always,
//           ),
//           TextFormField(
//             obscureText: true,
//             decoration:
//                 const InputDecoration(icon: Icon(Icons.lock), labelText: "密码"),
//             onSaved: (value) {
//               password = value;
//             },
//             autovalidateMode: AutovalidateMode.always,
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           Container(
//             width: double.infinity,
//             height: 44,
//             child: TextButton(
//               style: const ButtonStyle(
//                   backgroundColor: WidgetStatePropertyAll<Color>(Colors.green)),
//               onPressed: registerForm,
//               child: const Text(
//                 "注 册",
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }