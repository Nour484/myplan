import 'dart:io';

class Item {
   @override
  String toString() {
    // TODO: implement toString
    return "$title //////////////////////////////// $body ////////////////$images";
  }


  Item({
    required this.title,
    required this.body,
    required this.images,
  });

  String title;
  String body;
  List<File> ? images =[];
}
