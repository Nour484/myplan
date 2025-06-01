

class Album {
  Album(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }

  int userId;

  int id;

  String title;

  String body;
}
