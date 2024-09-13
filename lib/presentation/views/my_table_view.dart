import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/cubits/add_data_in_table/add_data_in_table_cubit.dart';
import 'package:mycollege/presentation/views/screens/my_table.dart';

import '../../utils/def.dart';
import 'screens/create_table_screen.dart';

class MyTableView extends StatelessWidget {
  const MyTableView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddDataInTableCubit>(
      create: (context) => AddDataInTableCubit(),
      child: box.isEmpty ? const CreateTableScreen() : const MyTable(),
    );
  }
}
