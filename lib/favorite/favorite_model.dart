import 'package:flutter/material.dart';

import '../add_items/item.dart';

class FavoriteModel extends ChangeNotifier {
  final List<Item> _favorites = [];

  List<Item> get favorites => _favorites;

  void addItem(Item item) {
    if (!_favorites.contains(item)) {
      _favorites.add(item);
      notifyListeners();
    }
  }

  void removeFav(Item item) {
    if (_favorites.contains(item)) {
      _favorites.remove(item);
      notifyListeners();
    }
  }

  bool isFavorite(Item item) {
    return _favorites.any((e) => e == item);
  }
}
