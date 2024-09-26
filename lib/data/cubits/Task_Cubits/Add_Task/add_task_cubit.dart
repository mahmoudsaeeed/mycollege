import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/def.dart';
import '../../../models/task_model/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  void addTask(TaskModel newTask) {
    taskBox.add(newTask);
    taskName!.clear();
    taskDetail!.clear();
    emit(AddTaskSuccess());
  }
}
