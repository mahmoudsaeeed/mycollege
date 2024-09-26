import 'package:flutter_bloc/flutter_bloc.dart';

part 'deadline_state.dart';

class DeadlineCubit extends Cubit<DeadlineState> {
  DeadlineCubit() : super(DeadlineInitial());
  String lastDeadline = "";
  setDeadline(String deadline) {
    lastDeadline = deadline;
    emit(DeadlineSuccess(deadline: deadline));
  }
}
