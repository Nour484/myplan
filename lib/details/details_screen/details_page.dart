import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskbygithub/add_items/item_model.dart';
import '../../add_items/view/add_item_screen.dart';
import '../../profile/profile_page/profile_page.dart';
import '../details_widget/home_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemModel = Provider.of<ItemModel>(context);
    final selectedItem = itemModel.selectedItem;
    final imagePaths = selectedItem!.images!.split(','); // Convert string to List<String>

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              icon: Icon(Icons.account_box))
        ],
        centerTitle: true,
           title: Text("The ${ selectedItem!.title}"),
      ),
      body: Consumer<ItemModel>(
          builder: (BuildContext context, item, Widget? child) {
        return ListView(children: [
          item.items == null || item.items!.isEmpty
              ? Image.asset("asset/tree.jpg")
              :


          Image.file(
            selectedItem!.images.split(',').map((path) => File(path)).toList().first,
                  height: 300,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FavoriteWidget( index: item.items.indexOf(selectedItem) ,),
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  textAlign: TextAlign.justify,
                  item.items[0].body ??
                      "A tree is a tall plant with a woody stem, branches, and leaves. It plays a vital role in nature by producing oxygen, providing shade, and offering a details to many animals. Trees absorb carbon dioxide and help reduce air pollution. They come in many types, like oak, pine, and mango. Trees also prevent soil erosion and are important for the water cycle. People use trees for wood, paper, and fruit. In cities and forests, trees add beauty and support life. Planting and protecting trees is essential for a healthy environment and a better future for all living things.")),
          item.items[0].images == null || item.items[0].images!.isEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MySeason(url: "asset/tree.jpg", text: "Spring"),
                    MySeason(url: "asset/fall.jpg", text: "Fall"),
                  ],
                )
              : SizedBox(
                  height: 500,
                  child: GridView.builder(
                      itemCount: imagePaths!.length,
                      itemBuilder: (context, index) => Image.file(

            File(imagePaths[index]),
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      )),
                )
        ]);
      }),
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
