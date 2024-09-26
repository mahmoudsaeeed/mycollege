import 'package:flutter/material.dart';

class MyTextFormFieldAddTask extends StatelessWidget {
  const MyTextFormFieldAddTask({
    super.key,
    this.linesNumber = 1,
    this.lettersNumber = 255,
    required this.myController,
    this.keyboardType,
    this.hintText,
    this.autoFocus = false,
  });
  final int linesNumber, lettersNumber;
  final TextEditingController myController;
  final TextInputType? keyboardType;
  final String? hintText;
  final bool autoFocus;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(20))),

        // OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),

        hintText: hintText,
        isDense: true,
        filled: true,
      ),
      maxLines: null,
      maxLength: lettersNumber,
      controller: myController,
      keyboardType: keyboardType,
    );
  }
}
