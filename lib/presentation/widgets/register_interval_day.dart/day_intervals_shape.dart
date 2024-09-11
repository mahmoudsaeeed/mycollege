import 'package:flutter/material.dart';
import '../../../utils/def.dart';
import '../my_text_form_field.dart';
import '../../../utils/constant.dart';

class DayIntervalsShape extends StatelessWidget {
  const DayIntervalsShape({
    super.key,
    required this.dayName,
    required this.noOfIntervals,
    required this.dayNo,
  });

  //TODO  dayName should be from enum in constants

  final Days dayName;
  final int noOfIntervals, dayNo;

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
              (index) {
                return Row(
                  children: [
                    MyTextFormField(
                      myController: dayControllers[dayNo]![index],
                      labelText: "الفترة ${index + 1}",
                    ),
                    // Container(
                    //   width: 100,
                    //   color: Colors.red,
                    //   child: const Text("hello"),
                    // )
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
