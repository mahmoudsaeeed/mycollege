import 'package:flutter/material.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/def.dart';
import '../my_text_form_field.dart';
import 'my_drop_down_in_interval_type.dart';

//* previous (list_add_table)
class DayIntervalsShape extends StatelessWidget {
  const DayIntervalsShape({
    super.key,
    required this.dayName,
    required this.noOfIntervals,
    required this.dayNumber,
  });


  final Days dayName;
  final int noOfIntervals, dayNumber;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        // color: Colors.amber,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(arDay[dayName].toString()),
            Column(
                children: List.generate(
              noOfIntervals,
              (intervalNumberInDay) {
                return Row(
                  children: [
                    MyTextFormField(
                      myController:
                          dayControllers[dayNumber]![intervalNumberInDay],
                      labelText: "الفترة ${intervalNumberInDay + 1}",
                    ),
                    MyDropDownIntervalType(
                      dayNumber: dayNumber,
                      intervalNumber: intervalNumberInDay,
                    )
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}

