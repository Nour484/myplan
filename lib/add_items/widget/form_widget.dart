

import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {



  final GlobalKey<FormState> formKey;
  final TextEditingController title;
  final TextEditingController body;

  const FormWidget({
    super.key,
    required this.formKey,
    required this.title,
    required this.body,
  });

  // @override
  @override
  Widget build(BuildContext context) {
    return   Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(

              controller: title,
              validator:  (title) {
                if (title == null || title.isEmpty) {
                  return " Please Enter Title";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  hintText: "title", border: OutlineInputBorder()),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: body,
              validator:  (body) {
                if (body == null || body.isEmpty) {
                  return " Please Enter Title";
                } else {
                  return null;
                }
              },
              minLines: 3,
              maxLines: 7,
              decoration: InputDecoration(
                  hintText: "body", border: OutlineInputBorder()),
            ),
          ),
        ],
      ),
    ) ;
  }
}
