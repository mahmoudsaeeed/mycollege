import 'package:flutter/material.dart';
import 'package:mycollege/utils/dismissible_keyboard.dart';

import '../../../../utils/def.dart';
import 'my_row_bottom_btns.dart';
import 'my_text_form_field_add_task.dart';

class MyModalBottomSheetAddTask extends StatefulWidget {
  const MyModalBottomSheetAddTask({super.key});

  @override
  State<MyModalBottomSheetAddTask> createState() =>
      _MyModalBottomSheetAddTaskState();
}

class _MyModalBottomSheetAddTaskState extends State<MyModalBottomSheetAddTask> {
  @override
  void initState() {
    super.initState();

    taskName = TextEditingController();
    taskDetail = TextEditingController();
    debugPrint("my add modal is opened");
  }

  @override
  void dispose() {
    taskName?.dispose();
    taskDetail?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: GestureDetector(
        onTap: () {
          myDisKeybaord(context);
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                MyTextFormFieldAddTask(
                  myController: taskName!,
                  hintText: "اسم التاسك",
                  keyboardType: TextInputType.text,
                  autoFocus: true,
                ),
                // const MyContainerDeadline(),
                MyTextFormFieldAddTask(
                  myController: taskDetail!,
                  lettersNumber: 500,
                  hintText: "التفاصيل...",
                  keyboardType: TextInputType.multiline,
                ),
                MyRowBottomBtns()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
