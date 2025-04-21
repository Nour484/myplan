
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
          ? Container(
              color: Colors.white38,
              height: 150,
              width: MediaQuery.sizeOf(context).width - 20,
              child: IconButton(
                  onPressed: () {
                    item.imageSelector();
                  },
                  icon: Icon(Icons.camera_alt)),
            )
          : Row(
              children: [
                Container(
                  color: Colors.white38,
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
