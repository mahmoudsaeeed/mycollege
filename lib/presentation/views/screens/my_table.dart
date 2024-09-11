import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../generated/l10n.dart';
import '../../widgets/myTable/my_popup_menu.dart';
import '../../../utils/MyTable_Method/row_table.dart';
import '../../../utils/constant.dart';
import '../../../utils/def.dart';

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
          ? rotationScreen(context)
          : myTableScreen(context);
    });
  }
}


Widget rotationScreen(context) {
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

Widget myTableScreen(context) {
  return Scaffold(
    appBar: AppBar(),
    floatingActionButton: const MyPopupMenu(),
    body: SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable: secondBox.listenable(),
        builder: (context, value, child) => Table(
          border: const TableBorder(
            horizontalInside: BorderSide(width: 1),
            verticalInside: BorderSide(width: 1),
          ),
          children: [
            // mainRowInTable(value.intervalNumber!),
            mainRowInTable(
              value.get(intervalSharedPref),
            ),
            ...List.generate(
              Days.values.length,
              (index) {
                return bodyRowInTable(
                  Days.values.elementAt(index), index,
                  value.get(intervalSharedPref),
                  // value.intervalNumber!,
                );
              },
            )
          ],
        ),
      ),
    ),
  );
}
// class MyTableScreen extends StatelessWidget {
//   const MyTableScreen({super.key, required this.intervalNumber});
//   final int intervalNumber;
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }


// Widget myTableScreen(context) {
  
// }
