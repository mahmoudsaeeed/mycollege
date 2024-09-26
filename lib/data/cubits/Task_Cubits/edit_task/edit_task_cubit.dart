import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/def.dart';
import '../../../models/task_model/task_model.dart';

part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit() : super(EditTaskInitial());


  updateTask(TaskModel newTask , int taskNumber) {

    taskBox.putAt(taskNumber, newTask);
  }
}
