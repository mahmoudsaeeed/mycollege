import 'package:flutter/material.dart';
import '../../utils/constant.dart';
import '../../utils/def.dart';

class IntervalNumberMenu extends StatefulWidget {
  const IntervalNumberMenu({super.key});

  @override
  State<IntervalNumberMenu> createState() => _IntervalNumberMenuState();
}

class _IntervalNumberMenuState extends State<IntervalNumberMenu> {
  int? currValue = 3;

  @override
  void initState() {
    // TODO: implement initState
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
//!11111111111111111111111111111111111111111

        secondBox.put(intervalSharedPref, value);
        print(
            "new value stored in interval in box = ${secondBox.get(intervalSharedPref)}");

        // BlocProvider.of<IntervalNumberCubit>(context)
        //     .currIntervalNumber(value!);
      },
    );
  }
}
