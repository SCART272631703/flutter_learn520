// // 25.1.使用Flutter的image_picker和拍照_flutter 拍照插件camera和imagepicker-CSDN博客
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const SettingsPage(),
//     );
//   }
// }

// class SettingsPage extends StatefulWidget {
//   const SettingsPage({super.key});

//   @override
//   SettingsPageState createState() => SettingsPageState();
// }

// class SettingsPageState extends State<SettingsPage> {
//   late File selectedImage;
//   late SharedPreferences _prefs;

//   @override
//   void initState() {
//     super.initState();
//     // 调用 _loadPrefs 方法来初始化 _selectedImage 变量
//     _loadPrefs();
//   }

//   Future<File> _loadPrefs() async {
//     _prefs = await SharedPreferences.getInstance();
//     final imagePath = _prefs.getString('imagePath');
//     if (imagePath != null) {
//       return File(imagePath);
//     } else {
//       return File('assets/touxiang.jpg');
//     }
//   }

//   Future<void> _saveImagePath(String imagePath) async {
//     await _prefs.setString('imagePath', imagePath);
//   }

//   Future<void> pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: source);
//     if (pickedImage != null) {
//       setState(() {
//         selectedImage = File(pickedImage.path);
//       });
//       _saveImagePath(pickedImage.path);
//     }
//   }


//   void _updateSelectedImage(File image) {
//     setState(() {
//       selectedImage = image;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16),
//             color: Colors.grey[200],
//             child: Row(
//               children: [
//                 // 使用 FutureBuilder 来等待异步操作完成，避免 LateInitializationError 错误
//                 FutureBuilder(
//                   future: _loadPrefs(),
//                   builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
//                     if (snapshot.connectionState == ConnectionState.done) {
//                       return InkWell(
//                         onTap: () {
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                 title: const Text('选择头像'),
//                                 actions: [
//                                   TextButton(
//                                     child: const Text('从相册选择'),
//                                     onPressed: () async {
//                                       Navigator.of(context).pop();
//                                       final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//                                       if (pickedImage != null) {
//                                         _updateSelectedImage(File(pickedImage.path));
//                                         _saveImagePath(pickedImage.path);
//                                       }
//                                     },
//                                   ),
//                                   TextButton(
//                                     child: const Text('拍照'),
//                                     onPressed: () async {
//                                       Navigator.of(context).pop();
//                                       final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
//                                       if (pickedImage != null) {
//                                         _updateSelectedImage(File(pickedImage.path));
//                                         _saveImagePath(pickedImage.path);
//                                       }
//                                     },
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         },
//                         // 使用条件运算符来检查 _selectedImage 是否为 null，并使用默认头像路径
//                         child: CircleAvatar(
//                           radius: 40,
//                           backgroundImage: snapshot.data != null ? FileImage(snapshot.data!) as ImageProvider<Object>?: const AssetImage('assets/touxiang.jpg'),
//                         ),
//                       );
//                     } else {
//                       return const CircularProgressIndicator();
//                     }
//                   },
//                 ),
//                 const SizedBox(width: 16),
//                 const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '江上清风山间明月',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     Text(
//                       '用户ID: 123456',
//                       style: TextStyle(fontSize: 14, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const Divider(indent: 60,),
//           const SettingItem(icon: Icons.person, title: '个人信息'),
//           const Divider(indent: 60,),
//           const SettingItem(icon: Icons.lock, title: '账号与安全'),
//           const Divider(indent: 60,),
//           const SettingItem(icon: Icons.notifications, title: '消息通知'),
//           const Divider(indent: 60,),
//           const SettingItem(icon: Icons.language, title: '语言'),
//           // 添加更多的设置项...
//         ],
//       ),
//     );
//   }
// }

// class SettingItem extends StatelessWidget {
//   final IconData icon;
//   final String title;

//   const SettingItem({required this.icon, required this.title, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Icon(icon),
//       title: Text(title),
//       trailing: const Icon(Icons.arrow_forward_ios),
//       onTap: () => {},
//     );
//   }
// }
