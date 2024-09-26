import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycollege/data/cubits/Task_Cubits/deadline/deadline_cubit.dart';
import 'package:mycollege/presentation/widgets/TaskWidgets/AddTaskWidgets/deadline_place.dart/my_deadline_btn.dart';
import 'package:mycollege/utils/dismissible_keyboard.dart';
import '../../../../data/models/task_model/task_model.dart';
import '../../../../utils/def.dart';

import 'my_text_form_field.dart';

class MyModalBottomSheetEditTask extends StatefulWidget {
  const MyModalBottomSheetEditTask({super.key, required this.taskNumber});
  final int taskNumber;

  @override
  State<MyModalBottomSheetEditTask> createState() =>
      _MyModalBottomSheetEditTaskState();
}

class _MyModalBottomSheetEditTaskState
    extends State<MyModalBottomSheetEditTask> {
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey();
    taskEditName = TextEditingController();
    taskEditDetail = TextEditingController();
    taskEditName!.text = taskBox.getAt(widget.taskNumber)!.taskName;
    taskEditDetail!.text = taskBox.getAt(widget.taskNumber)!.details;
    final deadline = taskBox.getAt(widget.taskNumber)!.deadline;
    BlocProvider.of<DeadlineCubit>(context).setDeadline(deadline);
    debugPrint(
        "--------------  deadline in box =  ${deadline}     -----------------");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    taskEditName!.dispose();
    taskEditDetail!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected = taskBox.getAt(widget.taskNumber)!.isSelected;
    TaskModel currTask = taskBox.getAt(widget.taskNumber)!;
    return GestureDetector(
      onTap: () {
        myDisKeybaord(context);
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 100,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                MyTextFormField(
                  myController: taskEditName!,
                  onChanged: (p0) {
                    currTask.taskName = p0;
                    taskBox.putAt(widget.taskNumber, currTask);
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: MyTextFormField(myController: taskEditDetail! , onChanged: (p0) {
                    currTask.details = p0;
                    taskBox.putAt(widget.taskNumber, currTask);
                  },),
                  trailing: Checkbox(
                    value: isSelected,
                    onChanged: (isSelect) {
                      setState(() {
                        isSelected = isSelect!;
                        TaskModel newTask = taskBox.getAt(widget.taskNumber)!;
                        newTask.isSelected = isSelected;
                        taskBox.putAt(widget.taskNumber, newTask);
                      });
                    },
                  ),
                ),
                BlocBuilder<DeadlineCubit, DeadlineState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        // EditTaskButton(
                        //   taskNumber: widget.taskNumber,
                        //   isSelected: isSelected,
                        // ),
                        BlocBuilder<DeadlineCubit, DeadlineState>(
                          builder: (context, state) {
                            // showDialog(
                            //   context: context,
                            //   builder: (context) => AlertDialog(
                            //       title: state is DeadlineSuccess
                            //           ? const Text("state is success in edit modal")
                            //           : const Text("state is failed in edit modal")),
                            // );
                            return (state is DeadlineSuccess)
                                ? state.deadline != ""
                                    ? Text(state.deadline)
                                    : MyDeadlineBtn(taskNumber : widget.taskNumber)
                                : const Text("error here");
                          },
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
