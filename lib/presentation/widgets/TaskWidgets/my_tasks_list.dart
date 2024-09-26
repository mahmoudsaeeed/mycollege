import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../utils/def.dart';
import 'my_dismissible.dart';

class MyTasksList extends StatelessWidget {
  const MyTasksList({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: taskBox.listenable(),
      builder: (context, tasks, child) {
        return ListView.builder(
          itemCount: tasks.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, taskNumber) {
            return MyDismissible(taskNumber: taskNumber);
          },
        );
      },
    );
  }
}
