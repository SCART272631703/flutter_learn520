// import 'home_model.dart';
// import 'home_request.dart';
// import 'movie_list_item.dart';
// import 'package:flutter/material.dart';

// const count = 20;

// class Home extends StatelessWidget {
//   const Home({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("⾸⻚"),
//       ),
//       body: const Center(
//         child: HomeContent(),
//       ),
//     );
//   }
// }

// class HomeContent extends StatefulWidget {
//   const HomeContent({super.key});
//   @override
//   HomeContentState createState() => HomeContentState();
// }

// class HomeContentState extends State<HomeContent> {
//   // 初始化⾸⻚的⽹络请求对象
//   HomeRequest homeRequest = HomeRequest();
//   final int _start = 0;
//   List<MovieItem> movies = [];
//   @override
//   void initState() {
//     super.initState();
//     // 请求电影列表数据
//     getMovieTopList(_start, count);
//   }

//   void getMovieTopList(start, count) {
//     homeRequest.getMovieTopList(start, count).then((result) {
//       setState(() {
//         movies.addAll(result);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: movies.length,
//         itemBuilder: (BuildContext context, int index) {
//           return MovieListItem(movies[index]);
//         });
//   }
// }
