import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/def.dart';
import '../register_interval_day.dart/day_intervals_shape.dart';

class ListAddTable extends StatelessWidget {
  const ListAddTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),

        /// loop on days length
        itemCount: Days.values.length,
        itemBuilder: (context, dayNumber) {
          // / in each day it will create [DayIntervalShape] depend on interval number
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            
                
                  ValueListenableBuilder(
                    valueListenable: secondBox.listenable(),
                    builder: (context, value, child) => DayIntervalsShape(
                      dayName: Days.values.elementAt(dayNumber),
                      // dayName: "tests",
                      noOfIntervals: value.get(intervalSharedPref),
                      dayNumber: dayNumber,
                    ),
                  ),
                
              
              const Divider(
                indent: 20,
                endIndent: 20,
              )
            ],
          );
        },
      ),
    );
  }
}
