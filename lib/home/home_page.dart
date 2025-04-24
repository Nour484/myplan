import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskbygithub/add_items/item.dart';
import 'package:taskbygithub/add_items/item_model.dart';
import 'package:taskbygithub/profile/profile_model.dart';
import '../add_items/view/add_item_screen.dart';
import '../details/details_screen/details_page.dart';
import '../favorite/FavoriteView.dart';
import '../favorite/favorite_model.dart';
import '../profile/profile_page/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileModel = Provider.of<ProfileModel>(context);
    final image = profileModel.profile?.image;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoriteView()));
              },
              icon: Icon(Icons.data_array)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              icon: image == null
                  ? Icon(Icons.person)
                  : ClipOval(
                      child: Image.file(
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                      File(image),
                    )))
        ],
      ),
      body: Consumer<ItemModel>(
        builder: (BuildContext context, item, Widget? child) =>
            GridView.builder(
          itemCount: item.items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (BuildContext context, int index) => InkWell(
            onTap: () {
              Provider.of<ItemModel>(context, listen: false).setSelectedItem(
                  Item(
                      fav: item.items[index].fav,
                      title: item.items[index].title,
                      body: item.items[index].body,
                      images: item.items[index].images));

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailsPage()));
            },
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.file(
                    item.items[index].images![0],
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.items[index].title),
                IconButton(
                  onPressed: () {
                    final favModel = Provider.of<FavoriteModel>(context, listen: false);
                    final currentItem = item.items[index];

                    favModel.isFavorite(currentItem)
                        ? favModel.removeFav(currentItem)
                        : favModel.addItem(currentItem);
                  },
                  icon: Consumer<FavoriteModel>(
                    builder: (context, favModel, child) {
                      final currentItem = item.items[index];
                      final isFav = favModel.isFavorite(currentItem);

                      return Icon(
                        Icons.favorite,
                        color: isFav ? Colors.red : Colors.grey.shade800,
                      );
                    },
                  ),
                )






                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddItemScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
