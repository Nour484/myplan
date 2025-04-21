import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskbygithub/add_items/item.dart';
import 'package:taskbygithub/add_items/item_model.dart';
import '../add_items/view/add_item_screen.dart';
import '../details/details_screen/details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      
      appBar:  AppBar( title:  Text( "Home"),),
      body: Consumer<ItemModel>(
        builder: (BuildContext context, item, Widget? child) =>
            GridView.builder(
          itemCount: item.items.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount: 2,
               crossAxisSpacing: 10,
               mainAxisSpacing: 10 ,
                  childAspectRatio :  0.7,

              ),
          itemBuilder: (BuildContext context, int index) => InkWell(

            onTap: () {

              Provider.of<ItemModel>(context, listen: false).setSelectedItem(Item(title: item.items[index].title, body:  item.items[index]. body, images:  item.items[index]. images));

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage()));} ,
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.file(
                    item.items[index].images![0] ,
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                  ),
                  Row(
                    mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                    children: [

                      Text(item.items[index].title),
                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite))
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
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AddItemScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
