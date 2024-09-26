import 'package:flutter/material.dart';

import 'MyTable_Screens/my_table_screen.dart';
import 'MyTable_Screens/rotation_screen.dart';

class MyTable extends StatelessWidget {
  const MyTable({
    super.key,
    // required this.intervalNumber
  });
  // final int intervalNumber;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.portrait
          ? const RotationScreen()
          : const MyTableScreen();
    });
  }
}