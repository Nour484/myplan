import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskbygithub/add_items/item.dart';
import 'package:taskbygithub/add_items/item_model.dart';
import 'package:taskbygithub/add_items/srevice/service.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
      body: Consumer<ItemModel>(
        child: Center(child: Text("No Item yet")),
        builder: (BuildContext context, fav, child) {
          return FutureBuilder<List<Item>>(
            future: TreeHelper().getFavoriteItems(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return child!;
              }

              final favoriteItems = snapshot.data!;

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: favoriteItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final current = favoriteItems[index];

                  return Column(
                    children: [
                      Image.file(
                        File(current.images.split(',').first),
                        height: 170,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(current.title),
                          IconButton(
                            onPressed: () async {
                              current.fav = false;
                              await TreeHelper()
                                  .updateItem(current, current.title);
                              fav.loadItemsFromDb(); // Refresh the provider
                            },
                            icon: Icon(Icons.favorite, color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
