import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_model.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      

      appBar:  AppBar( title:  Text("Favorites"), 
      
      
      
      ),
      body: Consumer<FavoriteModel>(
        builder: (context, favorite, child) => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount:favorite.favorites.length ,
          itemBuilder: (BuildContext context, int index) {

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Image.file(
                        width: 200,
                        height: 200 ,
                        fit:  BoxFit.cover,
                        favorite.favorites[index].images![0]),

                    IconButton(onPressed: (){

                      final provider =  Provider.of<FavoriteModel>(context, listen: false);
                      provider.favorites[index].fav = false ;

                      provider.removeFav(provider.favorites[index]);







                    }, icon: Icon(Icons.favorite , color:  Colors.red,))
                  ],
                ),
              );

          },
        ),
      ),
    );
  }
}
