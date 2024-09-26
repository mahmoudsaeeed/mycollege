import 'package:flutter/material.dart';
import '../../../../utils/MyTable_Method/select_colors.dart';

List<Widget> bodyCell(
    int totalIntervalNumbers, int dayNumber, List allIntervals) {
  return List.generate(
    totalIntervalNumbers,
    (intervalNumber) {
      return Container(
        padding: const EdgeInsets.all(10),
        color: selectColor(dayNumber, intervalNumber),
        alignment: Alignment.center,
        child: Text(allIntervals[intervalNumber]),
      );
    },
  );
}