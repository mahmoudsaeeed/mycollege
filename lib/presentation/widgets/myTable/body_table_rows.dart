import 'package:flutter/material.dart';
import 'package:mycollege/presentation/widgets/myTable/table_rows.dart';
import 'package:mycollege/utils/def.dart';

List<TableRow> bodyTableRows(TableRows myTableRow) {
  return List.generate(
    Days.values.length,
    (dayNumber) {
      Days currDay = Days.values.elementAt(dayNumber);
      return myTableRow.bodyRow(
        currDay,
        dayNumber,        // value.intervalNumber!,
      );
    },
  );
}