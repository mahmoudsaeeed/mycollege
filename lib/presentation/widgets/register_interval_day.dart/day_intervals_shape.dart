import 'package:flutter/material.dart';
import 'package:mycollege/utils/key_of_storage.dart';
import '../../../utils/def.dart';
import '../my_text_form_field.dart';
import '../../../utils/constant.dart';

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

class MyDropDownIntervalType extends StatefulWidget {
  const MyDropDownIntervalType({
    super.key,
    required this.dayNumber,
    required this.intervalNumber,
  });
  final int dayNumber, intervalNumber;

  @override
  State<MyDropDownIntervalType> createState() => _MyDropDownIntervalTypeState();
}

class _MyDropDownIntervalTypeState extends State<MyDropDownIntervalType> {
    String currChoise = intervalTypes.last;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: 100,
      child: DropdownButton(
        value: currChoise,
        items: List.generate(
          //* 3
          intervalTypes.length,
          (intervalTypeNumber) {
            return DropdownMenuItem(
              value: intervalTypes[intervalTypeNumber],
              child: Text(
                intervalTypes[intervalTypeNumber],
              ),
            );
          },
        ),
        onChanged: (choise) {
          secondBox.put(
              keyOfStorage(widget.dayNumber, widget.intervalNumber), choise??currChoise);
          setState(() {
            currChoise = choise!;
          });
        },
        
      ),
    );
  }
}
