import 'package:flutter/material.dart';

import '../../../../data/models/task_model/task_model.dart';

class MyTitle extends StatelessWidget {
  const MyTitle({super.key, required this.currTask});
  final TaskModel currTask;
  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Text(currTask.taskName),
              Text(
                "الموعد النهائي  ${currTask.deadline}",
                style: const TextStyle(fontSize: 12, color: Colors.white54),
              ),
            ],
          );
  }
}