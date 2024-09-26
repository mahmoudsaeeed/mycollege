import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({super.key, required this.myController, this.onChanged});
  final TextEditingController myController;
  
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: myController,
        maxLines: null,
        decoration: const InputDecoration(filled: true),
        onChanged: onChanged
      ),
    );
  }
}