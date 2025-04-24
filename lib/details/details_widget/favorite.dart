import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../add_items/item_model.dart';
import '../../favorite/favorite_model.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. جيبي العنصر الحالي من ItemModel
    final currentItem = Provider.of<ItemModel>(context, listen: false)
        .selectedItem!;

    return Consumer<FavoriteModel>(
      builder: (context, favModel, child) {
        // 2. تحققي إذا العنصر في favorites
        final isFav = favModel.isFavorite(currentItem);

        return IconButton(
          // 3. ضغطة الزر: تضيف أو تحذف
          onPressed: () {
            if (isFav) {

              favModel.removeFav(currentItem);
            } else {
              favModel.addItem(currentItem);
            }
          },
          // 4. اللون بيتغيّر حسب isFav
          icon: Icon(
            Icons.favorite,
            color: isFav ? Colors.red : Colors.grey.shade800,
          ),
        );
      },
    );
  }
}
