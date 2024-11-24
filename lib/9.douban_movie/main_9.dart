// import 'package:flutter/material.dart';
// // import 'home.dart';
// // import 'subject.dart';
// // import 'group.dart';
// // import 'mall.dart';
// // import 'profile.dart';
// class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//  return MaterialApp(
//  title: "⾖瓣",
//  theme: ThemeData(
//  primaryColor: Colors.green,
//  highlightColor: Colors.transparent,
//  splashColor: Colors.transparent
//  ),
//  home: MyStackPage(),
//  );
//  }
// }
// class MyStackPage extends StatefulWidget {
//  @override
//  MyStackPageState createState() => MyStackPageState();
// }
// class MyStackPageState extends State<MyStackPage> {
//  var _currentIndex = 0;
//  @override
//  Widget build(BuildContext context) {
//  return Scaffold(
//  bottomNavigationBar: BottomNavigationBar(
//  currentIndex: _currentIndex,
//  selectedFontSize: 14,
//  unselectedFontSize: 14,
//  type: BottomNavigationBarType.fixed,
//  items: [
//  createItem("home", "⾸⻚"),
//  createItem("subject", "书影⾳"),
//  createItem("group", "⼩组"),
//  createItem("mall", "市集"),
//  createItem("profile", "我的"),
//  ],
//  onTap: (index) {
//  setState(() {
//  _currentIndex = index;
//  });
//  },
//  ),
//  body: IndexedStack(
//  index: _currentIndex,
//  children: <Widget>[
//  Home(),
//  Subject(),
//  Group(),
//  Mall(),
//  Profile()
//  ],
//  ),
//  );
//  }
// }

// BottomNavigationBarItem createItem(String iconName, String title) {

//  return BottomNavigationBarItem(

//  icon: Image.asset("assets/images/tabbar/$iconName.png", width: 30,),

//  activeIcon: Image.asset("assets/images/tabbar/${iconName}_active.png", width: 30,),

// title: Text(title)

// );


// // BottomNavigationBarItem createItem(String iconName, String title) {
// //  return BottomNavigationBarItem(
// //  icon: Image.asset("assets/images/tabbar/$iconName.png", width: 30,),
// //  activeIcon: Image.asset("assets/images/tabbar/${iconName}_active.png", width: 30,),
// //  title: Text(title)
// //  );
// }