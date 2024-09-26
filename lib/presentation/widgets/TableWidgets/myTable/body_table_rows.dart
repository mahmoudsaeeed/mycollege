import 'package:flutter/material.dart';

import '../../../../utils/def.dart';
import 'table_rows.dart';

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