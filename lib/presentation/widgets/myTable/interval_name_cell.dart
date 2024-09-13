import 'package:flutter/material.dart';

List<Widget> intervalNameCell(int totalIntervalNumbers, context) {
  return List.generate(
    totalIntervalNumbers,
    (index) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Text(
          "الفترة ${index + 1}",
          style: Theme.of(context).dataTableTheme.headingTextStyle,
        ),
      );
    },
  );
}
