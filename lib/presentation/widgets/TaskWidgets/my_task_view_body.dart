import 'package:flutter/material.dart';

import 'my_tasks_list.dart';

class MyTaskViewBody extends StatelessWidget {
  const MyTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: MyTasksList(),
    );
  }
}