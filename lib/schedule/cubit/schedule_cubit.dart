import 'package:bloc/bloc.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleState.day1);

  void toggleTab(int index) => emit(ScheduleState.values[index]);
}
