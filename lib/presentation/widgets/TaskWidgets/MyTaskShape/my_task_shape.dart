import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycollege/data/cubits/Task_Cubits/deadline/deadline_cubit.dart';
import 'package:mycollege/data/cubits/Task_Cubits/edit_task/edit_task_cubit.dart';
import '../../../../data/models/task_model/task_model.dart';
import '../../../../utils/def.dart';
import '../EditTaskWidgets/my_modal_bottom_sheet_edit_task.dart';
import 'my_decorated_container.dart';
import 'my_title.dart';

class MyTaskShape extends StatefulWidget {
  const MyTaskShape({super.key, required this.taskNumber});

  /// [taskNumber] is the index of task in taskBox
  final int taskNumber;

  @override
  State<MyTaskShape> createState() => _MyTaskShapeState();
}

class _MyTaskShapeState extends State<MyTaskShape> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = taskBox.getAt(widget.taskNumber)!.isSelected;
    TaskModel currTask = taskBox.getAt(widget.taskNumber)!;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          useRootNavigator: true,
          isScrollControlled: true,
          showDragHandle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.all(Radius.circular(10))),
          // barrierColor: Colors.red,
          // elevation: 100,
          isDismissible: true,

          context: context,
          builder: (context) {
            return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => DeadlineCubit(),
                  ),
                  BlocProvider(
                    create: (context) => EditTaskCubit(),
                  ),
                ],
                child:
                    MyModalBottomSheetEditTask(taskNumber: widget.taskNumber));
          },
        );
      },
      child: MyDecoratedContainer(
        taskNumber: widget.taskNumber,
        child: ListTile(
          title: MyTitle(currTask: currTask),
          subtitle: Text(
            currTask.details,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Checkbox(
            value: isSelected,
            onChanged: (isSelect) {
              setState(() {
                isSelected = isSelect ?? false;
              });

              //* here we change [isSelected property of task ] depending on checkbox
              TaskModel newTask = currTask;
              newTask.isSelected = isSelected;
              taskBox.putAt(widget.taskNumber, newTask);
            },
          ),
        ),
      ),
    );
  }
}
