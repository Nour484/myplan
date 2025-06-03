import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../item_model.dart';

class ImageSelectorWidget extends StatelessWidget {
  const ImageSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemModel>(
        builder: (BuildContext context, item, Widget? child) {
      return item.selectedImage!.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(25)),
                //color: Colors.white38,
                height: 150,
                width: MediaQuery.sizeOf(context).width - 20,
                child: IconButton(
                    onPressed: () {
                      item.imageSelector();
                    },
                    icon: Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colors.grey.shade800,
                    )),
              ),
            )
          : Row(
              children: [
                Container(
                  color: Colors.blue.shade50,
                  height: 100,
                  width: 100,
                  child: IconButton(
                      onPressed: () {
                        item.imageSelector();
                      },
                      icon: Icon(Icons.camera_alt)),
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.sizeOf(context).width - 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: item.selectedImage!
                        .map((toElement) => Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Image.file(
                                    toElement,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(Icons.cancel),
                                    onPressed: () {
                                      item.removeImage(item.selectedImage!
                                          .indexOf(toElement));
                                    })
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ],
            );
    });
  }
}
