import 'package:flutter/material.dart';

class MyDecoratedContainer extends StatelessWidget {
  const MyDecoratedContainer({super.key, this.child, required this.taskNumber});
  final Widget? child;
  final int taskNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
          color:
              taskNumber % 2 == 0 ? Colors.grey[600] : Colors.grey[800],
          borderRadius: BorderRadius.only(
            topRight: taskNumber % 2 == 0
                ? const Radius.circular(10)
                : Radius.zero,
            topLeft: taskNumber % 2 == 0
                ? Radius.zero
                : const Radius.circular(10),
            bottomRight: taskNumber % 2 == 0
                ? Radius.zero
                : const Radius.circular(10),
            bottomLeft: taskNumber % 2 == 0
                ? const Radius.circular(10)
                : Radius.zero,
          )),
      child: child,
    );
  }
}