import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mycollege/data/cubits/Task_Cubits/deadline/deadline_cubit.dart';
import 'package:mycollege/data/models/task_model/task_model.dart';

import '../../../../data/cubits/Task_Cubits/Add_Task/add_task_cubit.dart';
import '../../../../utils/def.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeadlineCubit, DeadlineState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            final deadline = state is DeadlineSuccess ? state.deadline : "";
            TaskModel newTask = TaskModel(
              taskName: taskName!.text,
              details: taskDetail!.text,
              isSelected: false,
              deadline: deadline,
            );
            BlocProvider.of<AddTaskCubit>(context).addTask(newTask);
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("added successfully"),
                  content: Text("secondBox has now ${taskBox.length}"),
                );
              },
            );
          },
          style: const ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(Color.fromARGB(255, 12, 72, 121))),
          child: const Row(
            children: [Icon(Icons.add), Gap(10), Text("إضافة التاسك")],
          ),
        );
      },
    );
  }
}
