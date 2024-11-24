// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// // 初始化，并设置适配尺⼨及字体⼤⼩，是否根据系统的“字体⼤⼩”辅助选项来进⾏缩放
// // 在使⽤之前，请设置好设计稿的宽度和⾼度，传⼊设计稿的宽度和⾼度(单位随意,但在使⽤过程中必须保持⼀致)
// // ⼀定要进⾏初始化(只需设置⼀次),以保证在每次使⽤之前设置好了适配尺⼨:
// // ⽅式⼀（您必须在app中使⽤它⼀次）:
// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //填⼊设计稿中设备的屏幕尺⼨,单位dp
//     return ScreenUtilInit(
//       designSize: const Size(360, 690),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'First Method',
//           // You can use the library anywhere in the app even in theme
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//             textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
//           ),
//           home: child,
//         );
//       },
//       child: const HomePage(title: 'First Method'),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   final String title;
//   const HomePage({super.key, required this.title});
//   @override
//   Widget build(BuildContext context) {
//     return const Text("HomePage");
//   }
// }

// ⽅式⼆: 你需要⼀个技巧来⽀持⽂字⾃适应主题
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  // Add this line
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter_ScreenUtil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(displayMedium: TextStyle(fontSize: 30.sp)),
      ),
      home: const HomePage(title: 'FlutterScreenUtil Demo'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //设置尺⼨（填写设计中设备的屏幕尺⼨）如果设计基于360dp * 690dp的屏幕
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return const Text("HomePage");
  }
}

// 使⽤
// API
// 传⼊设计稿的dp尺⼨
//  ScreenUtil().setWidth(540) (dart sdk>=2.6 : 540.w) //根据屏幕宽度适配尺⼨
//  ScreenUtil().setHeight(200) (dart sdk>=2.6 : 200.h) //根据屏幕⾼度适配尺⼨(⼀般根据宽度适配即可)
//  ScreenUtil().radius(200) (dart sdk>=2.6 : 200.r) //根据宽度或⾼度中的较⼩者进⾏调整
//  ScreenUtil().setSp(24) (dart sdk>=2.6 : 24.sp) //适配字体
//  12.sm // 取12和12.sp中的最⼩值
//  ScreenUtil.pixelRatio //设备的像素密度
//  ScreenUtil.screenWidth (dart sdk>=2.6 : 1.sw) //设备宽度
//  ScreenUtil.screenHeight (dart sdk>=2.6 : 1.sh) //设备⾼度
//  ScreenUtil.bottomBarHeight //底部安全区距离，适⽤于全⾯屏下⾯有按键的
//  ScreenUtil.statusBarHeight //状态栏⾼度 刘海屏会更⾼
//  ScreenUtil.textScaleFactor //系统字体缩放⽐例
//  ScreenUtil().scaleWidth // 实际宽度设计稿宽度的⽐例
//  ScreenUtil().scaleHeight // 实际⾼度与设计稿⾼度度的⽐例
//  ScreenUtil().orientation //屏幕⽅向

//  0.2.sw //屏幕宽度的0.2倍
//  0.5.sh //屏幕⾼度的50%
//  20.setVerticalSpacing // SizedBox(height: 20 * scaleHeight)
//  20.horizontalSpace // SizedBox(height: 20 * scaleWidth)
//  const RPadding.all(8) // Padding.all(8.r) - 获取到const的优点
//  EdgeInsets.all(10).w //EdgeInsets.all(10.w)
//  REdgeInsets.all(8) // EdgeInsets.all(8.r)
//  EdgeInsets.only(left:8,right:8).r // 
//  EdgeInsets.only(left:8.r,right:8.r).
//  BoxConstraints(maxWidth: 100, minHeight: 100).w //
//  BoxConstraints(maxWidth: 100.w, minHeight: 100.w)
//  Radius.circular(16).w //Radius.circular(16.w)
//  BorderRadius.all(Radius.circular(16)).w

// 适配尺⼨
// 传⼊设计稿的尺⼨(单位与初始化时的单位相同)：
// 根据屏幕宽度适配 width: ScreenUtil().setWidth(540),
// 根据屏幕⾼度适配 height: ScreenUtil().setHeight(200), ⼀般来说，控件⾼度也根据宽度进⾏适配
// 如果您的 dart sdk>=2.6，则可以使⽤⼀些特殊的函数：
// 例⼦：
// 你不应当这样做：
// Container(
//  width: ScreenUtil().setWidth(50),
//  height:ScreenUtil().setHeight(200),
// )

// 正确的⽅法应当是这样使⽤：
// Container(
//  width: 50.w,
//  height:200.h
// )

// 注意
// ⾼度也根据setWidth来做适配可以保证不变形(当你想要⼀个正⽅形的时候)
// setHeight⽅法主要是在⾼度上进⾏适配, 在你想控制UI上⼀屏的⾼度与实际中显⽰⼀样时使⽤.
// ⼀般来说，50.w!=50.h
// 例如:
// //如果你想显示⼀个矩形:
// Container(
//  width: 375.w,
//  height: 375.h,
// ),
// //如果你想基于宽显示⼀个正⽅形:
// Container(
//  width: 300.w,
//  height: 300.w,
// ),
// //如果你想基于⾼显示⼀个正⽅形:
// Container(
//  width: 300.h,
//  height: 300.h,
// ),
// //如果你想基于⾼或宽中的较⼩值显示⼀个正⽅形:
// Container(
//  width: 300.r,
//  height: 300.r,
// ),


// 适配字体
// //输⼊字体⼤⼩（单位与初始化时的单位相同）
// ScreenUtil().setSp(28) 
// 28.sp
// //例⼦:
// Column(
//  crossAxisAlignment: CrossAxisAlignment.start,
//  children: <Widget>[
//  Text('16sp, 因为设置了`textScaleFactor`，不会随系统变化.',
//  style: TextStyle(color: Colors.black,fontSize: 16.sp,
//  ),
//  textScaleFactor: 1.0,
//  ),
//  Text('16sp,如果未设置，我的字体⼤⼩将随系统⽽变化.',
//  style: TextStyle(color: Colors.black,fontSize: 16.sp,
//  ),
//  ),
//  ],
// )

// 设置字体不随系统字体⼤⼩进⾏改变
// APP全局:
//  MaterialApp(
//  debugShowCheckedModeBanner: false,
//  title: 'Flutter_ScreenUtil',
//  theme: ThemeData(
//  primarySwatch: Colors.blue,
//  ),
//  builder: (context, widget) {
//  return MediaQuery(
//  ///设置⽂字⼤⼩不随系统设置改变
//  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//  child: widget,
//  );
//  },
//  home: HomePage(title: 'FlutterScreenUtil Demo'),
//  ),

// 单独的Text:
// Text("text", textScaleFactor: 1.0)
// 指定的⼩部件：
// MediaQuery(
//  // 如果这⾥context不可⽤，你可以新建⼀个 [Builder] 将[MediaQuery] 放⼊其中
// data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
// child: AnyWidget(),
// )