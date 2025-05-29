import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskbygithub/add_items/item_model.dart';
import 'package:taskbygithub/add_items/srevice/service.dart';

import '../../home/nav_bar.dart';
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
        body:
        // MergeSemantics(
        //   child: Container(
        //       decoration: BoxDecoration(
        //           image: DecorationImage(
        //         fit: BoxFit.cover,
        //         image: AssetImage("asset/background.jpg"),
        //       )),
        //       child:
              ListView(
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
             // )),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: ()  async{
              if (_formKey.currentState!.validate()) {
                final imageListCopy = List<File>.from(
                  Provider.of<ItemModel>(context, listen: false).selectedImage!,
                );
                // Provider.of<ItemModel>(context, listen: false).addItem(Item(
                //   id: Random().nextInt(100),
                //   title: title.text,
                //   body: body.text,
                //   images: imageListCopy,
                // ));

                final dbHelper = TreeHelper();
                final  b=TreeHelper();
                print (dbHelper== b) ;
              await dbHelper.openDb();
                final insertedItem =  await dbHelper.
                insert(Item(
                 // id: Random().nextInt(100),
                  title: title.text,
                  body: body.text,
                  fav:   false,
                  images:  imageListCopy.map((file) => file.path).join(','),
                ));
                // print(Item(
                //   title: title.text,
                //   body: body.text,
                //   images: imageListCopy,
                // ));
                Provider.of<ItemModel>(context, listen: false).addItem(insertedItem);
                    // .selectedImage!
                    // .clear();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => NavBar()));
              }
            }));
  }
}
