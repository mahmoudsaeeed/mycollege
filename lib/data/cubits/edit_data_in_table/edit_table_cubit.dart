
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_table_state.dart';

class EditTableCubit extends Cubit<EditTableState> {
  EditTableCubit() : super(EditTableInitial());
}
