import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../theme/theme_model.dart';
import '../profile_widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker imagePicker = ImagePicker();

  File? selectedImage;

  Future<void> imageSelector(  ImageSource   source) async {
    XFile? image = await imagePicker.pickImage(source: source);

    if (image != null  && mounted) {


       setState(() {
         selectedImage = File(image!.path);
       });


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile "),
        actions: [ IconButton(
          onPressed: () {
            Provider.of<ThemeModel>(context, listen: false)
                .changeMode();
          },
          icon: Icon(Provider.of<ThemeModel>(context).lightModel ? Icons.dark_mode : Icons.light_mode),
          //  label: Text(Provider.of<ThemeModel>(context).lightMode ? "dark" : "Light")
        ),],
      ),
      body: Column(
        children: [

          Center(
              child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                 // backgroundColor: Colors.grey.shade500,
                  radius: 100,
                  child: selectedImage == null
                      ? Icon(
                          Icons.person,
                          size: 200,
                        color: Colors.white70,
                        )
                      : ClipOval(child: Image.file(

                    height:  200,
                       width:  200,
                       fit: BoxFit.cover,


                      selectedImage!))),
              CircleAvatar(
              //    backgroundColor: Colors.black,
                  radius: 25,
                  child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => SizedBox(
                                  height: 150,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Profile ",
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Options(
                                            onPressed: () {
                                              imageSelector( ImageSource.camera);
                                              Navigator.pop(context) ;
                                            },
                                            title: "Camera",
                                            icon: Icons.camera_alt,
                                          ),
                                          Options(
                                            onPressed: () {

                                              imageSelector( ImageSource.gallery);

                                              Navigator.pop(context) ;
                                            },
                                            title: "Gallery",
                                            icon: Icons.image,
                                          ),
                                       if(selectedImage != null)
                                              Options( selectedImage: selectedImage,

                                                onPressed: () {

                                                  if (mounted) {
                                                    setState(() {
                                                      selectedImage = null;
                                                    });
                                                  }
                                                  Navigator.pop(context) ;
                                                },
                                                title:  "delete",
                                                icon: Icons.delete,
                                              ),

                                        ],
                                      )
                                    ],
                                  ),
                                ));
                      },
                      icon: Icon(
                        //color: Colors.grey,
                        Icons.camera_alt,
                        size: 35,
                      )))
            ],
          ))
       ,
        ListTile(
           title: Text("Name "), 
          subtitle: Text("Nour Ahmed "),
          leading:  Icon(Icons.person),

        ),
          ListTile(
            title: Text("Bio "),
            subtitle: Text("Code. Sleep. Eat. Repeat "),
            leading:  Icon(Icons.info),

          )

         ],
      ),
    );
  }
}
