import 'dart:io';

class Item {
  @override
  String toString() {
    // TODO: implement toString
    return "$title //////////////////////////////// $body ////////////////$images";
  }

  Item({
     this.id,
    required this.title,
    required this.body,
    required this.images,
    this.fav = false,
  });

  int ? id;

  String title;
  String body;
  bool fav;
 String images ;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'images': images,
    };
  }

  factory Item.formJsom(Map<dynamic, dynamic> json){
    return Item(id: json["id"],
        title: json["title"],
        body: json ["body"],
        images: json ["images"]) ;
  }


  @override
  bool operator ==(Object other) =>
      other is Item &&
          other.id == id &&
          other.title == title &&
          other.body == body &&
          other.images == images;

  @override
  int get hashCode => title.hashCode ^ body.hashCode ^ images.hashCode;
}
