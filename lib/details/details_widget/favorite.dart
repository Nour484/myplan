import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskbygithub/add_items/srevice/service.dart';

import '../../add_items/item_model.dart';
import '../../favorite/favorite_model.dart';

class FavoriteWidget extends StatelessWidget {
  FavoriteWidget({required this.index, super.key});

  int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemModel>(
      builder: (context, itemModel, child) {
        final currentItem = itemModel.items[index];
        final fav = Provider.of<FavoriteModel>(context);

        return IconButton(
          onPressed: () {
            fav.isFavorite(currentItem);
            TreeHelper().updateItem(currentItem, currentItem.title);
          },
          icon: Icon(
            Icons.favorite,
            color: currentItem.fav ? Colors.red : Colors.grey,
          ),
        );
      },
    );
  }
}
