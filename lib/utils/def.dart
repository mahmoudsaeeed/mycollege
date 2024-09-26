// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mycollege/data/models/table_model/day_table_model.dart';
import 'package:mycollege/data/models/task_model/task_model.dart';

import 'constant.dart';

//!  ########   [ Boxs defination ]  ########
Box tableBox = Hive.box<DayTableModel>(tableBoxName);
Box secondBox = Hive.box(secondBoxName);
Box<TaskModel> taskBox = Hive.box<TaskModel>(taskboxName);

enum Days {
  Saturday,
  Sunday,
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
}

//* -------------- TextEditingControllers --------------------*//

TextEditingController satController0 = TextEditingController();
TextEditingController satController1 = TextEditingController();
TextEditingController satController2 = TextEditingController();
TextEditingController satController3 = TextEditingController();

TextEditingController sunController0 = TextEditingController();
TextEditingController sunController1 = TextEditingController();
TextEditingController sunController2 = TextEditingController();
TextEditingController sunController3 = TextEditingController();

TextEditingController monController0 = TextEditingController();
TextEditingController monController1 = TextEditingController();
TextEditingController monController2 = TextEditingController();
TextEditingController monController3 = TextEditingController();

TextEditingController tusController0 = TextEditingController();
TextEditingController tusController1 = TextEditingController();
TextEditingController tusController2 = TextEditingController();
TextEditingController tusController3 = TextEditingController();

TextEditingController wedController0 = TextEditingController();
TextEditingController wedController1 = TextEditingController();
TextEditingController wedController2 = TextEditingController();
TextEditingController wedController3 = TextEditingController();

TextEditingController thuController0 = TextEditingController();
TextEditingController thuController1 = TextEditingController();
TextEditingController thuController2 = TextEditingController();
TextEditingController thuController3 = TextEditingController();
////////////////////////////////////////////////////////////////

TextEditingController? taskName;
TextEditingController? taskDetail;
// TextEditingController? deadlineController;

////////////////////////////////////////////////////////////////

TextEditingController? taskEditName; 
TextEditingController? taskEditDetail;
// TextEditingController taskDeadlineEdit = TextEditingController();

// TextEditingController taskName = TextEditingController();
// TextEditingController taskName = TextEditingController();
