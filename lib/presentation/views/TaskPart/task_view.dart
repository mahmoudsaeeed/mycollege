import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../utils/def.dart';
import '../../widgets/TaskWidgets/my_floating_button.dart';
import '../../widgets/TaskWidgets/my_task_view_body.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        floatingActionButton: const MyFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ValueListenableBuilder(
          valueListenable: taskBox.listenable(),
          builder: (context, value, child) {
            return value.isEmpty
                ? const Center(
                    child: Text("لا يوجد تاسكات"),
                  )
                : const MyTaskViewBody();
          },
        ));
  }
}
