import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../data/cubits/Table_Cubits/add_data_in_table/add_data_in_table_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/def.dart';
import '../../../widgets/TableWidgets/interval_number_menu.dart';
import '../../../widgets/TableWidgets/list_add_table.dart/list_add_table.dart';

class CreateTableScreen extends StatelessWidget {
  const CreateTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: const Color.fromARGB(255, 29, 39, 58),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const IntervalPart(),
                const ListAddTable(),
                ValueListenableBuilder(
                  valueListenable: secondBox.listenable(),
                  builder: (context, value, child) => ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AddDataInTableCubit>(context).addData(
                        value.get(intervalSharedPref),
                      );

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("تم اضافة الجدول بنجاح "),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, homeView, (route) => false);
                                  },
                                  child: const Text("اشطا يجميل"))
                            ],
                          );
                        },
                      );
                    },
                    child: Text(S.of(context).save),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class IntervalPart extends StatelessWidget {
  const IntervalPart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          //*  عدد الفترات
          Text(S.of(context).intervalNo),
          Container(
            width: 50,
            color: Colors.blue,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const IntervalNumberDropDown(),
          ),
        ],
      ),
    );
  }
}
