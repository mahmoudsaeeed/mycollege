import 'package:flutter/material.dart';
import 'package:mycollege/generated/l10n.dart';

class RotationScreen extends StatelessWidget {
  const RotationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),
    body: Column(
      children: [
        Image.asset("assets/images/rotateMobile.gif"),
        Text(S.of(context).turnMobile),
      ],
    ),
  );
  }
}