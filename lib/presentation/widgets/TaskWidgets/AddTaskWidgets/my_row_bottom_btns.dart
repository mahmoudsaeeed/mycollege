import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/cubits/Task_Cubits/deadline/deadline_cubit.dart';
import 'add_task_btn.dart';
import 'deadline_place.dart/my_deadline_btn.dart';

class MyRowBottomBtns extends StatelessWidget {
  const MyRowBottomBtns({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AddTaskButton(),
        BlocBuilder<DeadlineCubit, DeadlineState>(
          builder: (context, state) {
            return state is DeadlineSuccess
                ? Text(state.deadline)
                : const MyDeadlineBtn();
          },
        )
      ],
    );
  }
}
