

import 'dart:io';

import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String title;

  final IconData icon;

  Colors? color;

// <<<<<<< HEAD
//   String ? selectedImage;
// =======
  File ? selectedImage;
// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b

  VoidCallback onPressed;

  Options(
      {required this.onPressed,
        this.color,

        this.selectedImage,
        required this.title,
        required this.icon,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          color:  selectedImage == null? Colors.grey.shade800: Colors.red,
          icon: Icon(
            icon,
          ),
          onPressed: onPressed,
        ),
        Text(title   , style:  TextStyle(color:  selectedImage == null?  Colors.grey.shade800 : Colors.red), )
      ],
    );
  }
}
