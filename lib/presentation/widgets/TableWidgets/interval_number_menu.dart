import 'package:flutter/material.dart';
import '../../../utils/constant.dart';
import '../../../utils/def.dart';

class IntervalNumberDropDown extends StatefulWidget {
  const IntervalNumberDropDown({super.key});

  @override
  State<IntervalNumberDropDown> createState() => _IntervalNumberDropDownState();
}

class _IntervalNumberDropDownState extends State<IntervalNumberDropDown> {
  int? currValue = 3;

  @override
  void initState() {
    super.initState();

    secondBox.put(intervalSharedPref, currValue!);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: currValue,
      items: List.generate(
        4,
        (index) {
          return DropdownMenuItem<int>(
            value: index + 1,
            child: Text((index + 1).toString()),
          );
        },
      ),
      onChanged: (value) async {
        setState(() {
          currValue = value;
        });

        secondBox.put(intervalSharedPref, value);
        print(
            "new value stored in interval in tableBox = ${secondBox.get(intervalSharedPref)}");

        // BlocProvider.of<IntervalNumberCubit>(context)
        //     .currIntervalNumber(value!);
      },
    );
  }
}
