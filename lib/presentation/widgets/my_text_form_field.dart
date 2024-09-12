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
    GlobalKey<FormFieldState> txtFormfieldKey = GlobalKey();
    return Container(
      width: 200,
      margin: const EdgeInsets.all(10),
      // padding: const EdgeInsets.all(20),

      child: TextFormField(
        key: txtFormfieldKey,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return "Please , Enter correct value";
        //   }
        //   return null;
        // },
        // onChanged: (value) {
        //   if (txtFormfieldKey.currentState!.validate()) {
        //     print("yes");
        //   } else {
        //     print("no");
        //   }
        // },
        controller: myController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          // constraints: BoxConstraints(),
          isDense: true,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
