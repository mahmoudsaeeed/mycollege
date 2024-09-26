import 'package:flutter/material.dart';
import 'MyTaskShape/my_task_shape.dart';
import '../../../utils/def.dart';

class MyDismissible extends StatelessWidget {
  const MyDismissible({super.key, required this.taskNumber});

  /// [taskNumber] is the index of task in taskBox
  final int taskNumber;

  @override
  Widget build(BuildContext context) {
    // final TaskModel currTask = taskBox.get(widget.taskNumber)!;
    return Dismissible(
      key: ObjectKey(taskBox.getAt(taskNumber)!),
      background: Container(
        color: Colors.red,
      ),
      direction: DismissDirection.startToEnd,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("هل تريد المسح ؟ "),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text("اوك")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text("لا")),
              ],
            );
          },
        );
      },
      onDismissed: (direction) async {
        try {
          await taskBox.deleteAt(taskNumber);
          debugPrint("deleted successfully");
        } catch (error) {
          // Handle deletion error (e.g., show a snackbar)
          print("Error deleting task: $error");
        }
      },
      child: MyTaskShape(taskNumber: taskNumber),
    );
  }
}
