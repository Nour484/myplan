import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taskbygithub/api/album.dart';


class ApiService {
  Future<List<Album>> fetchAlbum() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      List<dynamic> listJsonAlbum = jsonDecode(response.body);

      return listJsonAlbum.map((json) => Album.fromJson(json as Map<String , dynamic>)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
