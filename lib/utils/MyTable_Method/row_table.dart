import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
import 'package:mycollege/data/models/day_table_model.dart';
import 'package:mycollege/utils/MyTable_Method/select_colors.dart';
import 'package:mycollege/utils/def.dart';

TableRow mainRowInTable(int totalIntervalNumbers) {
  return TableRow(
      decoration: const BoxDecoration(color: Color(0xff307874)),
      //TODO length will change soon after save data
      children: [
        Container(),
        ...List.generate(
          totalIntervalNumbers,
          (index) {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text("الفترة ${index + 1}"),
            );
          },
        )
      ]);
}

TableRow bodyRowInTable(Days day, int dayNumber , int totalIntervalNumbers) {
          DayTableModel day =  box.get(dayNumber);
        List allIntervals = returnListFromDayData(day);
  return TableRow(
    
    children: [
    Container(alignment: Alignment.center, child: Text(day.dayName)),
    // Text(dayControllers[dayNumber]![columnNumber].toString()),
    


    ...List.generate(
      totalIntervalNumbers,
      (columnNumber) {
        
        return Container(
          padding: const EdgeInsets.all(10),
          color: selectColor(dayNumber, columnNumber),
          alignment: Alignment.center,
          child: Text(allIntervals[columnNumber]),
        );
      },
    ),
  ]);
}


List returnListFromDayData (DayTableModel day){
  return [day.interval1 , day.interval2 , day.interval3 , day.interval4];
}