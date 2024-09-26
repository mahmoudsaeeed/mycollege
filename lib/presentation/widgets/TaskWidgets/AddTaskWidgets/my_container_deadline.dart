import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyContainerDeadlines extends StatefulWidget {
  const MyContainerDeadlines({super.key});

  @override
  State<MyContainerDeadlines> createState() => _MyContainerDeadlineState();
}

class _MyContainerDeadlineState extends State<MyContainerDeadlines> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO here when click on contaienr , calender will appear
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white60),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          // controller: deadlineController,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.calendar_today_rounded),
            hintText: "2022-01-01",
            contentPadding: EdgeInsetsDirectional.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
          ),
          keyboardType: TextInputType.datetime,
          onTap: () async {
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
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              print(
                  formattedDate); //formatted date output using intl package =>  2021-03-16
              setState(() {
                // deadlineController!.text =
                //     formattedDate; //set output date to TextField value.
              });
            } else {}
          },
          readOnly: true,
        ),
      ),
    );
  }
}
