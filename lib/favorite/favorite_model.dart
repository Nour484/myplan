// <<<<<<< HEAD
// import 'package:flutter/material.dart';
// =======
import 'package:flutter/cupertino.dart';
// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b

import '../add_items/item.dart';

class FavoriteModel extends ChangeNotifier {
// <<<<<<< HEAD
//   final List<Item> _favorites = [];
//
//   List<Item> get favorites => _favorites;
//
//   void addItem(Item item) {
//     if (!_favorites.contains(item)) {
//       _favorites.add(item);
//       notifyListeners();
//     }
//   }
//
//   void removeFav(Item item) {
//     if (_favorites.contains(item)) {
//       _favorites.remove(item);
//       notifyListeners();
//     }
//   }
//
//   bool isFavorite(Item item) {
//     return _favorites.any((e) => e == item);
// =======
  final List<Item> _fav = [];

  List<Item> get fav => _fav;

  void add(Item item) {
    if (!_fav.contains(item)) {
      _fav.add(item);

    }
    notifyListeners();
  }

  void remove(Item item) {
    if ( _fav.contains(item)) {
      _fav.remove(item);

    }
    notifyListeners();
  }

  void isFavorite(Item item) {
    item.fav = !item.fav;
    item.fav ? add(item)   : remove(item) ;

    notifyListeners();
// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b
  }
}
