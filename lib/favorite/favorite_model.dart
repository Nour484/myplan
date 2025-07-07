import 'package:flutter/cupertino.dart';

import '../add_items/item.dart';

class FavoriteModel extends ChangeNotifier {
  final List<Item> _fav = [];

  List<Item> get fav => _fav;

  void isFavorite(Item item) {
    item.fav = !item.fav;

    notifyListeners();
  }
}
