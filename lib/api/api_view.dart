

import 'package:flutter/material.dart';
import 'package:taskbygithub/api/album.dart';
import 'package:taskbygithub/api/api_service.dart';



class ApiView extends StatefulWidget {
  const ApiView({super.key});

  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
  late Future <List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = ApiService().fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Album>>(
        future: futureAlbum,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return ListView.builder(
              itemCount: snapShot.data!.length,
              itemBuilder: (context, index )=>
              Center(
                  child: ExpansionTile(
                title: Text(snapShot.data![index].title),
                subtitle: Text("${snapShot.data![index].userId}"),
                children: [Text(snapShot.data![index].body)],
              )),
            );
          }
          else if (snapShot.hasError) {
            return
              Center(child: Icon(Icons.wifi_off_rounded , size: 100, ));
          }


          return Center(child: CircularProgressIndicator());
        });
  }
}
