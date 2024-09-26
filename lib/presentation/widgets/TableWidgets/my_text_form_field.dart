import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.myController,
    this.labelText = "",
  });

  final TextEditingController myController;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        controller: myController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          isDense: true,
          labelText: labelText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          filled: true,
        ),
      ),
    );
  }
}
