import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycollege/utils/key_of_storage.dart';
import '../../models/table_model/day_table_model.dart';
import '../../../utils/constant.dart';
import '../../../utils/def.dart';

part 'add_data_in_table_state.dart';

class AddDataInTableCubit extends Cubit<AddDataInTableState> {
  AddDataInTableCubit() : super(AddDataInTableInitial());
/*
day [
  dayName ,
  interval 0,
  intervalType 0 , 

  

]
[

  [

  ],
  [],
  [],
  []


]

 */
  addData(int intervalNumber) {
    late DayTableModel day;
    for (int dayNumber = 0; dayNumber < Days.values.length; dayNumber++) {
      day = DayTableModel(
        dayName: arDay[Days.values.elementAt(dayNumber)]!,
        interval1: dayControllers[dayNumber]![0].value.text,
        interval2: dayControllers[dayNumber]![1].value.text,
        interval3: dayControllers[dayNumber]![2].value.text,
        interval4: dayControllers[dayNumber]![3].value.text,
        typeInterval1: secondBox.get(keyOfStorage(dayNumber, 0) , defaultValue: intervalTypes.last),
        typeInterval2: secondBox.get(keyOfStorage(dayNumber, 1) , defaultValue: intervalTypes.last),
        typeInterval3: secondBox.get(keyOfStorage(dayNumber, 2) , defaultValue: intervalTypes.last),
        typeInterval4: secondBox.get(keyOfStorage(dayNumber, 3) , defaultValue: intervalTypes.last),
      );
      box.put(dayNumber , day);
    }
    emit(AddDataInTableSuccess());
  }
}
