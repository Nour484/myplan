import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskbygithub/add_items/item.dart';
import 'package:taskbygithub/add_items/item_model.dart';
import 'package:taskbygithub/add_items/srevice/service.dart';
import 'package:taskbygithub/favorite/favorite_model.dart';
import 'package:taskbygithub/favorite/favorite_view.dart';

import '../add_items/view/add_item_screen.dart';
import '../details/details_screen/details_page.dart';
import '../details/details_widget/favorite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ItemModel>(context, listen: false).loadItemsFromDb(); // this calls setItems()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [


          Stack(
            // alignment: Alignment.topRight,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoriteView()));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red.shade700,
                  )),
              CircleAvatar(
                  radius: 10,
              //    backgroundColor: Colors.red.shade100,
                  child:
                      Text("${Provider.of<FavoriteModel>(context).fav.length}"))
            ],
          )
        ],
      ),
      body: Consumer<ItemModel>(
          child: Center(child: Text("No Item yet ")),
          builder: (BuildContext context, item, Widget? child) {
            if (item.items.isEmpty) return child!;
            return FutureBuilder<List<Item>>(
                future: TreeHelper().getItem(),
                builder: (context, snapshot) {
                  return GridView.builder(
                    itemCount: item.items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        Provider.of<ItemModel>(context, listen: false)
                            .setSelectedItem(Item(
                                id: item.items[index].id,
                                title: item.items[index].title,
                                body: item.items[index].body,
                                images: item.items[index].images));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage()));
                      },
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.file(
                              item!.items[index].images.split(',').map((path) => File(path)).toList().first,
                             // item.items[index].images![0],
                              fit: BoxFit.cover,
                              height: 200,
                              width: 200,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(item.items[index].title),
                                FavoriteWidget(
                                  index: item.items.indexOf(item.items[index]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AddItemScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
