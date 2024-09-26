import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/cubits/Task_Cubits/Add_Task/add_task_cubit.dart';
import '../../../data/cubits/Task_Cubits/deadline/deadline_cubit.dart';
import 'AddTaskWidgets/my_modal_bottom_sheet_add_task.dart';

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          showDragHandle: true,
          context: context,
          builder: (context) {
            return MultiBlocProvider(providers: [
              BlocProvider(
                create: (context) => AddTaskCubit(),
              ),
              BlocProvider(
                create: (context) => DeadlineCubit(),
              ),
            ], child: const MyModalBottomSheetAddTask());
          },
        );
      },
      icon: const Icon(Icons.add),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.amber[700]),
        iconColor: const WidgetStatePropertyAll(Colors.white),
        iconSize: const WidgetStatePropertyAll(30),
      ),
    );
  }
}
