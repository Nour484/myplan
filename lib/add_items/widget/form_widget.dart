import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController title;
  final TextEditingController body;

  const FormWidget({
// <<<<<<< HEAD
//     Key? key,
//     required this.formKey,
//     required this.title,
//     required this.body,
//   }) : super(key: key);
// =======
    super.key,
    required this.formKey,
    required this.title,
    required this.body,
  });

// >>>>>>> da4b4a4caed6d7d182adc9d225e4dc344093d15b

  // @override
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                controller: title,
                validator: (title) {
                  if (title == null || title.isEmpty) {
                    return " Please Enter Title";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  disabledBorder: InputBorder.none,
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  hintText: "title",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: Colors
                            .blue.shade100), // Outline color when not focused
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: body,
              validator: (body) {
                if (body == null || body.isEmpty) {
                  return " Please Enter Title";
                } else {
                  return null;
                }
              },
              minLines: 3,
              maxLines: 7,
              decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                fillColor: Colors.blue.shade50,
                filled: true,
                hintText: "body",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Colors
                          .blue.shade100), // Outline color when not focused
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
