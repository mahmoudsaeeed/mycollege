part of 'deadline_cubit.dart';

sealed class DeadlineState {}

final class DeadlineInitial extends DeadlineState {}

final class DeadlineSuccess extends DeadlineState {
  final String deadline;

  DeadlineSuccess({required this.deadline});

}
