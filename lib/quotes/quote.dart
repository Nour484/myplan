

class Quote {
  Quote(
      {required this.author,
      required this.category,
      required this.quote,
     });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quote: json["quote"],
      author: json["author"],
      category: json["category"],

    );
  }



  String quote;

  String author;
  String category;
}
