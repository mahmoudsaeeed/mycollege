import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
import 'package:mycollege/data/models/day_table_model.dart';
import 'package:mycollege/presentation/widgets/myTable/body_cell.dart';
import 'package:mycollege/presentation/widgets/myTable/day_name_cell.dart';
import 'package:mycollege/presentation/widgets/myTable/interval_name_cell.dart';
import 'package:mycollege/utils/def.dart';

class TableRows {
  final int totalIntervalNumbers;
  final BuildContext context;

  TableRows({
    required this.totalIntervalNumbers,
    required this.context,
  });

  TableRow headTableRow() {
    return TableRow(
        decoration: const BoxDecoration(color: Color(0xff307874)),
        children: [
          Container(),
          ...intervalNameCell(totalIntervalNumbers, context),
        ]);
  }

  TableRow bodyRow(
    Days day,
    int dayNumber,
  ) {
    DayTableModel day = box.get(dayNumber);
    List allIntervals = dayIntervalsList(day);
    return TableRow(children: [
      DayNameCell(day: day),
      // Text(dayControllers[dayNumber]![intervalNumber].toString()),
      ...bodyCell(totalIntervalNumbers, dayNumber, allIntervals),
    ]);
  }

  List dayIntervalsList(DayTableModel day) {
    return [day.interval1, day.interval2, day.interval3, day.interval4];
  }
}
