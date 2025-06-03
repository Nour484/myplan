import 'package:flutter/cupertino.dart';

import '../add_items/item.dart';

class FavoriteModel extends ChangeNotifier {
  final List<Item> _fav = [];

  List<Item> get fav => _fav;

  void add(Item item) {
    if (!_fav.contains(item)) {
      _fav.add(item);
    }
    notifyListeners();
  }

  void remove(Item item) {
    if (_fav.contains(item)) {
      _fav.remove(item);
    }
    notifyListeners();
  }

  void isFavorite(Item item) {
    item.fav = !item.fav;
    item.fav ? add(item) : remove(item);

    notifyListeners();
  }
}
