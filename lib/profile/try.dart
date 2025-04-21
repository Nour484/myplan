


    import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskbygithub/profile/profile_model/profile.dart';

import 'Service/service.dart';

class Try extends StatelessWidget {


  UserService profileService = UserService();
       Try({super.key});

      @override
      Widget build(BuildContext context) {

        print (profileService.getUsers()) ;
        return Scaffold(
          body: FutureBuilder<List<Profile>>(
            future: profileService.getUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
          
              if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No user found'));

              }
          
              final user = snapshot.data![0]; // أول يوزر
              print ( "kkkkkkkkkkkkkkkkkkk"+user.name ) ;
          
              return Card(
                child: ListTile(
                  leading: user.image != null
                      ? Image.file(File(user.image!), width: 50, height: 50, fit: BoxFit.cover)
                      : Icon(Icons.person, size: 50),
                  title: Text(user.name),
                  subtitle: Text(user.bio),
                ),
              );
            },
          ),
        );
      }
    }
