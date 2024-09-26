import 'package:hive_flutter/hive_flutter.dart';

class TaskModel extends HiveObject {
  String taskName;
  String deadline;
  String details;
  bool isSelected;

  TaskModel({
    required this.taskName,
    this.deadline = "",
    required this.details,
    required this.isSelected,
  });
}
