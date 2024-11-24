// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
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
//       home: const HYCameraScreen(),
//     );
//   }
// }
// class HYCameraScreen extends StatefulWidget {
//   const HYCameraScreen({super.key});
//   static const String routeName = "/camera";
//   @override
//   HYCameraScreenState createState() => HYCameraScreenState();
// }

// class HYCameraScreenState extends State<HYCameraScreen> {
//   File? selectedImage;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Camera"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             selectedImage == null
//                 ? const Text("未选择图⽚")
//                 : Image.file(selectedImage!),
//             TextButton(
//               child: const Text('从相册选择照片'),
//               onPressed: () async {
//                 final pickedImage =
//                     await ImagePicker().pickImage(source: ImageSource.gallery);
//                 if (pickedImage != null) {
//                   setState(() {
//                     selectedImage = File(pickedImage.path);
//                   });
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // void _pickImage() async {
//   //   File image = await ImagePicker.pickImage(source: ImageSource.gallery);
//   //   setState(() {
//   //     _image = image;
//   //   });
//   // }
// }
