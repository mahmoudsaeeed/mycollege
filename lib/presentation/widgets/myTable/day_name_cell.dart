import 'package:flutter/material.dart';
import 'package:mycollege/data/models/table_model/day_table_model.dart';

class DayNameCell extends StatelessWidget {
  const DayNameCell({super.key, required this.day});
  final DayTableModel day;
  @override
  Widget build(BuildContext context) {
    return   Container(
        alignment: Alignment.center,
        child: Text(
          day.dayName,
          style: Theme.of(context).dataTableTheme.headingTextStyle,
        ),
      );
  }
}