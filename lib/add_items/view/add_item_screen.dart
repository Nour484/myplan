import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskbygithub/add_items/item_model.dart';

import '../../home/home_page.dart';
import '../item.dart';
import '../widget/widget.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: MergeSemantics(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("asset/background.jpg"),
              )),
              child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  ImageSelectorWidget(),
                  FormWidget(
                    formKey: _formKey,
                    title: title,
                    body: body,
                  ),
                ],
              )),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final imageListCopy = List<File>.from(
                  Provider.of<ItemModel>(context, listen: false).selectedImage!,
                );
                Provider.of<ItemModel>(context, listen: false).addItem(Item(
                  fav: false,
                  title: title.text,
                  body: body.text,
                  images: imageListCopy,
                ));

                // print(Item(
                //   title: title.text,
                //   body: body.text,
                //   images: imageListCopy,
                // ));
                Provider.of<ItemModel>(context, listen: false)
                    .selectedImage!
                    .clear();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }
            }));
  }
}
