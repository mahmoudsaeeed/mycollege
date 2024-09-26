import 'package:hive_flutter/hive_flutter.dart';

import 'task_model.dart';

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  TaskModel read(BinaryReader reader) {
    return TaskModel(
      taskName: reader.readString(),
      deadline: reader.readString(),
      details: reader.readString(),
      isSelected: reader.readBool(),
    );
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer.writeString(obj.taskName);
    writer.writeString(obj.deadline);
    writer.writeString(obj.details);
    writer.writeBool(obj.isSelected);
  }
}
