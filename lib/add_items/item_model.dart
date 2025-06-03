import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// <<<<<<< HEAD
// =======
import 'package:taskbygithub/add_items/srevice/service.dart';
import 'package:taskbygithub/service/db_helper.dart';
// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b

import 'item.dart';

class ItemModel extends ChangeNotifier {
  List<Item> items = [];

  //add images
  ImagePicker imagePicker = ImagePicker();
  List<File>? selectedImage = [];

  Future<void> imageSelector() async {
    List<XFile>? images = await imagePicker.pickMultiImage();

// <<<<<<< HEAD
//     if (images != null) {
//       selectedImage!
//           .addAll(images.map((toElement) => File(toElement!.path)).toList());
//       notifyListeners();
//     }
//   }
// =======
    selectedImage!
        .addAll(images.map((toElement) => File(toElement.path)).toList());
    notifyListeners();
    }
// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b

  void removeImage(int index) {
    selectedImage!.removeAt(index);
    notifyListeners();
  }

  addItem(Item item) {
    items.add(item);
    notifyListeners();
  }

  Item? selectedItem;

  void setSelectedItem(Item item) {
    selectedItem = item;
    notifyListeners();
  }

// <<<<<<< HEAD
//
//
//
// =======
  void setItems(List<Item> newItems) {
    items = newItems;
    notifyListeners();
  }

  Future<void> loadItemsFromDb() async {
     final dbHelper = DBHelper();
    await dbHelper.openDb();
    final dbItems = await TreeHelper().getItem();
    setItems(dbItems);
  }
// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b
}
