import 'package:flutter/material.dart';
import 'def.dart';

const String tableBox = "table";
const String secondBoxName = "data";

const String homeView = "/";
const String myTableView = "myTable";

//! ####################
//!   secondBoxName variable
// مستخدمه في اسناد القيمه ل ساكندبوكس  في
// interval_number_menu
const String intervalSharedPref = "interval";

//! ####################

final List<String> intervalTypes = [
  "محاضرة",
  "سكشن",
  "فاضي"
];

//* names of arabic days
Map<Days, String> arDay = {
  Days.Saturday: "السبت",
  Days.Sunday: "الاحد",
  Days.Monday: "الاتنين",
  Days.Tuesday: "الثلاثاء",
  Days.Wednesday: "الاربعاء",
  Days.Thursday: "الخميس",
};

//*    dayContoller [dayNumber][intervalNumber]

Map<int, List<TextEditingController>> dayControllers = {
  0: [
    satController0,
    satController1,
    satController2,
    satController3,
  ],
  1: [
    sunController0,
    sunController1,
    sunController2,
    sunController3,
  ],
  2: [
    monController0,
    monController1,
    monController2,
    monController3,
  ],
  3: [
    tusController0,
    tusController1,
    tusController2,
    tusController3,
  ],
  4: [
    wedController0,
    wedController1,
    wedController2,
    wedController3,
  ],
  5: [
    thuController0,
    thuController1,
    thuController2,
    thuController3,
  ],
};
