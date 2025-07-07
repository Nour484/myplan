import 'dart:convert';

import 'package:http/http.dart' as http;

import 'quote.dart';

class QuoteService {
  Future<List<Quote> >fetchAlbum() async {
    final response = await http.get(
        headers: {'X-Api-Key': "ESAobgZl+YA+ibxxfmRzNg==KwXS3YiXdZ3CkLoM"},
        Uri.parse("https://api.api-ninjas.com/v1/quotes"));

    if (response.statusCode == 200) {
      final List<dynamic> listOfquote= jsonDecode(response.body );
      return listOfquote .map((quote) =>   Quote.fromJson(quote) ).toList();


    } else {
   
      throw Exception('Failed to load album');
    }
  }
}
