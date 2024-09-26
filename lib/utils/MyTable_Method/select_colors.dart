import 'package:flutter/material.dart';
import '../def.dart';
import '../key_of_storage.dart';

Color selectColor(int dayNumber, int intervalNumber) {
  switch (secondBox.get(keyOfStorage(dayNumber, intervalNumber))) {
    case "محاضرة":
      {
        return Colors.green;
      }
    case "سكشن":
      {
        return Colors.blue;
      }
    default:
      {
        return Colors.white;
      }
  }
}
