import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/cubits/Table_Cubits/add_data_in_table/add_data_in_table_cubit.dart';
import '../../../utils/def.dart';
import 'screens/create_table_screen.dart';
import 'screens/my_table.dart';

class MyTableView extends StatelessWidget {
  const MyTableView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddDataInTableCubit>(
      create: (context) => AddDataInTableCubit(),
      child: tableBox.isEmpty ? const CreateTableScreen() : const MyTable(),
    );
  }
}
