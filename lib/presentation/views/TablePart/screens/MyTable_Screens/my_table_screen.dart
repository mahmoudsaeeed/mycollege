import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../utils/constant.dart';
import '../../../../../utils/def.dart';
import '../../../../widgets/TableWidgets/myTable/body_table_rows.dart';
import '../../../../widgets/TableWidgets/myTable/my_popup_menu.dart';
import '../../../../widgets/TableWidgets/myTable/table_rows.dart';

class MyTableScreen extends StatelessWidget {
  const MyTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: const MyPopupMenu(),
      body: SingleChildScrollView(
        child: ValueListenableBuilder(
          valueListenable: secondBox.listenable(),
          builder: (context, totalIntervalNumbers, child) {
            int? totalIntervalNumber =
                totalIntervalNumbers.get(intervalSharedPref);
            TableRows myTableRow = TableRows(
                totalIntervalNumbers: totalIntervalNumber??0, context: context);
            return Table(
              border: const TableBorder(
                horizontalInside: BorderSide(width: 1),
                verticalInside: BorderSide(width: 1),
              ),
              children: [
                // headTableRow(totalIntervalNumbers.intervalNumber!),
                myTableRow.headTableRow(),
                ...bodyTableRows(myTableRow),
              ],
            );
          },
        ),
      ),
    );
  }
}


