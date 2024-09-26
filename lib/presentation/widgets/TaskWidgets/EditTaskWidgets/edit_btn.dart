import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycollege/data/cubits/Task_Cubits/deadline/deadline_cubit.dart';

import '../../../../data/cubits/Task_Cubits/edit_task/edit_task_cubit.dart';
import '../../../../data/models/task_model/task_model.dart';
import '../../../../utils/def.dart';

class EditTaskButton extends StatelessWidget {
  const EditTaskButton(
      {super.key, required this.taskNumber, required this.isSelected});
  final int taskNumber;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeadlineCubit, DeadlineState>(
      builder: (context, state) {
        // showDialog(
        //   context: context,
        //   builder: (context) => AlertDialog(
        //       title: state is DeadlineSuccess
        //           ? const Text("state is success in edit modal")
        //           : const Text("state is failed in edit modal")),
        // );
        return ElevatedButton(
            onPressed: () {
              TaskModel newTask = TaskModel(
                taskName: taskEditName!.text,
                deadline: state is DeadlineSuccess ? state.deadline : "",
                details: taskEditDetail!.text,
                isSelected: isSelected,
              );
              //TODO update doesn't work
              BlocProvider.of<EditTaskCubit>(context)
                  .updateTask(newTask, taskNumber);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("edit Successfully"),
                    content: const Text("yeeeh sucessfully add"),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("تمام"))
                    ],
                  );
                },
              );
            },
            child: const Text("تعديل"));
      },
    );
  }
}
