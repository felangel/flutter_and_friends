import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'schedule_state.dart';

class ScheduleCubit extends HydratedCubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleState.day1);

  void toggleTab(int index) => emit(ScheduleState.values[index]);

  @override
  ScheduleState? fromJson(Map<String, dynamic> json) {
    return ScheduleState.values[json['index'] as int];
  }

  @override
  Map<String, dynamic>? toJson(ScheduleState state) => {'index': state.index};
}
