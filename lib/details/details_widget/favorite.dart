// <<<<<<< HEAD
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// =======
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskbygithub/add_items/srevice/service.dart';

// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b

import '../../add_items/item_model.dart';
import '../../favorite/favorite_model.dart';

class FavoriteWidget extends StatelessWidget {
// <<<<<<< HEAD
//   const FavoriteWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // 1. جيبي العنصر الحالي من ItemModel
//     final currentItem = Provider.of<ItemModel>(context, listen: false)
//         .selectedItem!;
//
//     return Consumer<FavoriteModel>(
//       builder: (context, favModel, child) {
//         // 2. تحققي إذا العنصر في favorites
//         final isFav = favModel.isFavorite(currentItem);
//
//         return IconButton(
//           // 3. ضغطة الزر: تضيف أو تحذف
//           onPressed: () {
//             if (isFav) {
//
//               favModel.removeFav(currentItem);
//             } else {
//               favModel.addItem(currentItem);
//             }
//           },
//           // 4. اللون بيتغيّر حسب isFav
//           icon: Icon(
//             Icons.favorite,
//             color: isFav ? Colors.red : Colors.grey.shade800,
// =======
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
// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b
          ),
        );
      },
    );
  }
}
