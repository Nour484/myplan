// <<<<<<< HEAD
// import 'dart:io';
//
// class Item {
//
//
//   Item({
//     required this.title,
//     required this.body,
//     required this.images,
//     required this.fav,
//   });
//   String title;
//   bool fav;
//   String body;
//   List<File>? images = [];
//
//   @override
//   String toString() {
//     return "$title $body $images $fav";
// =======
class Item {
  @override
  String toString() {
    return "$title //////////////////////////////// $body ////////////////$images";
  }

  Item({
    this.id,
    required this.title,
    required this.body,
    required this.images,
    this.fav = false,
  });

  int? id;

  String title;
  String body;
  bool fav;
  String images;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'images': images,
    };
  }

  factory Item.formJsom(Map<dynamic, dynamic> json) {
    return Item(
        id: json["id"],
        fav: json["fav"] == 1,
        title: json["title"],
        body: json["body"],
        images: json["images"]);
// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b
  }

  @override
  bool operator ==(Object other) =>
// <<<<<<< HEAD
//       identical(this, other) ||
//           other is Item && other.title == title;
//
//   @override
//   int get hashCode => title.hashCode;
//
//
//
//
// }
//
//
// =======
      other is Item &&
      other.id == id &&
      other.title == title &&
      other.body == body &&
      other.images == images;

  @override
  int get hashCode => title.hashCode ^ body.hashCode ^ images.hashCode;
}
// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b
