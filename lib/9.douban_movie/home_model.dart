// class Person {
//   String name;
//   String avatarURL;
//   Person(this.name, this.avatarURL);
//   Person.fromMap(Map<String, dynamic> json)
//       : this(json["name"], json["avatars"]["medium"]);
// }

// class Actor extends Person {
//   Actor.fromMap(Map<String, dynamic> json) : super.fromMap(json);
// }

// class Director extends Person {
//   Director.fromMap(Map<String, dynamic> json) : super.fromMap(json);
// }

// int counter = 1;

// class MovieItem {
//   int rank;
//   String imageURL;
//   String title;
//   String playDate;
//   double rating;
//   List<String> genres;
//   List<Actor> casts;
//   Director director;
//   String originalTitle;
//   MovieItem(this.rank, this.imageURL, this.title, this.playDate, this.rating,
//       this.genres, this.casts, this.director, this.originalTitle);
//   MovieItem.fromMap(Map<String, dynamic> json)
//       : this(
//           counter++,
//           json["images"]["medium"],
//           json["title"],
//           json["year"],
//           json["rating"]["average"],
//           json["genres"].cast<String>(),
//           (json["casts"] as List<dynamic>).map((item) {
//             return Actor.fromMap(item);
//           }).toList(),
//           Director.fromMap(json["directors"][0]),
//           json["original_title"],
//         );
// }
