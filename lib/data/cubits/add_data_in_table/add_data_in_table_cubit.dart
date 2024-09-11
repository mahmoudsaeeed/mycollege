import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/day_table_model.dart';
import '../../../utils/constant.dart';
import '../../../utils/def.dart';

part 'add_data_in_table_state.dart';

class AddDataInTableCubit extends Cubit<AddDataInTableState> {
  AddDataInTableCubit() : super(AddDataInTableInitial());

  addData(int intervalNumber) {
    late DayTableModel day;
    for (int i = 0; i < Days.values.length; i++) {
      day = DayTableModel(
        dayName: arDay[Days.values.elementAt(i)]!,
        interval1: dayControllers[i]![0].value.text,
        interval2: dayControllers[i]![1].value.text,
        interval3: dayControllers[i]![2].value.text,
        interval4: dayControllers[i]![3].value.text,
      );
      box.put(i , day);
    }
    emit(AddDataInTableSuccess());
  }
}
