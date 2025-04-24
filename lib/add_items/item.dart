import 'dart:io';

class Item {


  Item({
    required this.title,
    required this.body,
    required this.images,
    required this.fav,
  });
  String title;
  bool fav;
  String body;
  List<File>? images = [];

  @override
  String toString() {
    return "$title $body $images $fav";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Item && other.title == title;

  @override
  int get hashCode => title.hashCode;




}


