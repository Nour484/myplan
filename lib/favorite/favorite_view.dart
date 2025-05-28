import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favorite_model.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          title: Text("Favorite"),
        ),
        body: Consumer<FavoriteModel>(
            child: Center(child: Text("No Item yet ")),
            builder: (BuildContext context, fav, Widget? child) {
              if (fav.fav.isEmpty) return child!;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.8,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: fav.fav.length,
                  itemBuilder: (BuildContext context, int index) {
                    final current = fav.fav[index];

                    return SizedBox(
                      child: Column(
                        children: [
                          Image.file(
                            current.images.split(',').map((path) => File(path)).toList().first,
                           // current.images![0],
                            height: 170,
                            width: 200,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(current.title),
                              IconButton(
                                  onPressed: () {
                                    fav.fav[index].fav = false;
                                    fav.remove(current);
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ))
                            ],
                          )
                        ],
                      ),
                    );
                  });
            }));
  }
}
