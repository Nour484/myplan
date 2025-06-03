import 'dart:io';

// <<<<<<< HEAD
// =======

// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskbygithub/add_items/item.dart';
import 'package:taskbygithub/add_items/item_model.dart';
// <<<<<<< HEAD
// import 'package:taskbygithub/profile/profile_model.dart';
// import '../add_items/view/add_item_screen.dart';
// import '../details/details_screen/details_page.dart';
// import '../favorite/FavoriteView.dart';
// import '../favorite/favorite_model.dart';
// import '../profile/profile_page/profile_page.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final profileModel = Provider.of<ProfileModel>(context);
//     final image = profileModel.profile?.image;
// =======
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

    Provider.of<ItemModel>(context, listen: false)
        .loadItemsFromDb(); // this calls setItems()
  }

  @override
  Widget build(BuildContext context)  {
// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
// <<<<<<< HEAD
//           IconButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => FavoriteView()));
//               },
//               icon: Icon(Icons.data_array)),
//           IconButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => ProfilePage()));
//               },
//               icon: image == null
//                   ? Icon(Icons.person)
//                   : ClipOval(
//                       child: Image.file(
//                       height: 40,
//                       width: 40,
//                       fit: BoxFit.cover,
//                       File(image),
//                     )))
//         ],
//       ),
//       body: Consumer<ItemModel>(
//         builder: (BuildContext context, item, Widget? child) =>
//             GridView.builder(
//           itemCount: item.items.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//             childAspectRatio: 0.7,
//           ),
//           itemBuilder: (BuildContext context, int index) => InkWell(
//             onTap: () {
//               Provider.of<ItemModel>(context, listen: false).setSelectedItem(
//                   Item(
//                       fav: item.items[index].fav,
//                       title: item.items[index].title,
//                       body: item.items[index].body,
//                       images: item.items[index].images));
//
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => DetailsPage()));
//             },
//             child: SizedBox(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Image.file(
//                     item.items[index].images![0],
//                     fit: BoxFit.cover,
//                     height: 200,
//                     width: 200,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(item.items[index].title),
//                 IconButton(
//                   onPressed: () {
//                     final favModel = Provider.of<FavoriteModel>(context, listen: false);
//                     final currentItem = item.items[index];
//
//                     favModel.isFavorite(currentItem)
//                         ? favModel.removeFav(currentItem)
//                         : favModel.addItem(currentItem);
//                   },
//                   icon: Consumer<FavoriteModel>(
//                     builder: (context, favModel, child) {
//                       final currentItem = item.items[index];
//                       final isFav = favModel.isFavorite(currentItem);
//
//                       return Icon(
//                         Icons.favorite,
//                         color: isFav ? Colors.red : Colors.grey.shade800,
//                       );
//                     },
//                   ),
//                 )
//
//
//
//
//
//
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context,
// =======

          Stack(
            // alignment: Alignment.topRight,
            children: [
              IconButton(
                  onPressed: () async {


                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoriteView()));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red.shade700,
                  )),
              // CircleAvatar(
              //     radius: 10,
              //     //    backgroundColor: Colors.red.shade100,
              //     child:
              //         Text("${ 0}"))
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
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                    title: Text("Delete"),
                                    content: Text(
                                        "Are you sure you want to delete ${item.items[index].title}?"),
                                    actions: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                        ),
                                        onPressed: () async {
                                          await TreeHelper()
                                              .deleteItem(item.items[index]);
                                          item.items =
                                              await TreeHelper().getItem();
                                          if (!mounted) return;
                                          setState(() {});
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("delete"),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text("Close"),
                                      )
                                    ]));
                      },
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
                              item.items[index].images
                                  .split(',')
                                  .map((path) => File(path))
                                  .toList()
                                  .first,
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
          Navigator.pushReplacement(
              context,
// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b
              MaterialPageRoute(builder: (context) => AddItemScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
