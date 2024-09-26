import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mycollege/data/models/task_model/task_model.dart';
import 'package:mycollege/utils/def.dart';

import '../../../../../data/cubits/Task_Cubits/deadline/deadline_cubit.dart';

class MyDeadlineBtn extends StatefulWidget {
  const MyDeadlineBtn({super.key,this.taskNumber});
  final int? taskNumber;
  @override
  State<MyDeadlineBtn> createState() => _MyDeadlineBtnState();
}

class _MyDeadlineBtnState extends State<MyDeadlineBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 3, 80, 57)),
      ),
      onPressed: () async {
        DateTime? pickedDate = await showDatePicker(
            locale: const Locale('en'),
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2100));

        if (pickedDate != null) {
          print(
              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          print(
              formattedDate); //formatted date output using intl package =>  2021-03-16
          setState(() {
            // deadlineController!.text =
            //     formattedDate; //set output date to TextField value.
            if(widget.taskNumber !=null){
              TaskModel task = taskBox.getAt(widget.taskNumber!)!;
            task.deadline = formattedDate;
            taskBox.putAt(widget.taskNumber!, task);
            }
            BlocProvider.of<DeadlineCubit>(context).setDeadline(formattedDate);

            debugPrint("deadline is added sucessfully");
          });
        } else {}
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("وضع موعد نهائي"),
          Gap(10),
          Icon(
            Icons.calendar_today_rounded,
            // color: Colors.amber,
            size: 20,
          ),
        ],
      ),
    );
  }
}
