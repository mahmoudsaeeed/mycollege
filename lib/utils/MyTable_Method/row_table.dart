import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
import 'package:mycollege/data/models/day_table_model.dart';
import 'package:mycollege/utils/def.dart';

TableRow mainRowInTable(int intervalNumber) {
  return TableRow(
      decoration: const BoxDecoration(color: Color(0xff307874)),
      //TODO length will change soon after save data
      children: [
        Container(),
        ...List.generate(
          intervalNumber,
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

TableRow bodyRowInTable(Days day, int rowNumber , int intervalNumber) {
          DayTableModel day =  box.get(rowNumber);
        List allIntervals = returnListFromDayData(day);
  return TableRow(
    
    children: [
    Container(alignment: Alignment.center, child: Text(day.dayName)),
    // Text(dayControllers[rowNumber]![columnNumber].toString()),
    


    ...List.generate(
      intervalNumber,
      (columnNumber) {
        
        return Container(
          padding: const EdgeInsets.all(10),
          color: Colors.blue[(columnNumber + 100) * 2],
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