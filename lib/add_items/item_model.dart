import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'item.dart';

class ItemModel extends ChangeNotifier {
  List<Item> items = [];

  //add images
  ImagePicker imagePicker = ImagePicker();
  List<File>? selectedImage = [];

  Future<void> imageSelector() async {
    List<XFile>? images = await imagePicker.pickMultiImage();

    if (images != null) {
      selectedImage!
          .addAll(images.map((toElement) => File(toElement!.path)).toList());
      notifyListeners();
    }
  }

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




}
