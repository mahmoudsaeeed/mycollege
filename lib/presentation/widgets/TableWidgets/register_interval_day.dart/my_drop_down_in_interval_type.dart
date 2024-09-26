import 'package:flutter/material.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/def.dart';
import '../../../../utils/key_of_storage.dart';

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
    return SizedBox(
      width: 100,
      child: DropdownButton(
        padding: const EdgeInsets.all(10),

        // isDense: true,
        isExpanded: true,
        menuWidth: 100,
        borderRadius: BorderRadius.circular(10),
        // dropdownColor: const Color.fromARGB(255, 214, 213, 213),
        alignment: Alignment.bottomCenter,
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
          secondBox.put(keyOfStorage(widget.dayNumber, widget.intervalNumber),
              choise ?? currChoise);
          setState(() {
            currChoise = choise!;
          });
        },
      ),
    );
  }
}
