import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:taskbygithub/profile/profile_model.dart';

import '../profile_widget/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile "),
      ),
      body: Consumer<ProfileModel>(
        builder: (context, profile, child) => Column(
          children: [
            Center(
                child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade500,
                  radius: 100,
                  child: profile.profile?.image != null
                      ?

                  ClipOval(
                    child: Image.file(

                     File( profile.profile!.image!) ,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  )
                  :
                  Icon(
                    Icons.person,
                    size: 200,
                    color: Colors.white38,
                  )

                ),
                CircleAvatar(
                    backgroundColor: Colors.black,
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
                                                profile.imageSelector(
                                                    ImageSource.camera);
                                                profile.createProfile(image: profile.profile!.image, name: "Nour Ahmed", bio: "");

                                                Navigator.pop(context);
                                              },
                                              title: "Camera",
                                              icon: Icons.camera_alt,
                                            ),
                                            Options(
                                              onPressed: () {
                                                profile.imageSelector(
                                                    ImageSource.gallery);

                                                Navigator.pop(context);
                                              },
                                              title: "Gallery",
                                              icon: Icons.image,
                                            ),
                                            if (profile.profile?.image != null)
                                              Options(
                                                selectedImage:
                                                    profile.profile!.image,
                                                onPressed: () {
                                                  // if (mounted) {
                                                  //   setState(() {

                                                  profile.removeImage();


                                                  //   });
                                                  // }
                                                  Navigator.pop(context);
                                                },
                                                title: "delete",
                                                icon: Icons.delete,
                                              ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ));
                        },
                        icon: Icon(
                          color: Colors.grey,
                          Icons.camera_alt,
                          size: 35,
                        )))
              ],
            )),
            ListTile(
              title: Text("Name "),
              subtitle: Text("Nour Ahmed "),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text("Bio "),
              subtitle: Text("Code. Sleep. Eat. Repeat "),
              leading: Icon(Icons.info),
            )
          ],
        ),
      ),
    );
  }
}
