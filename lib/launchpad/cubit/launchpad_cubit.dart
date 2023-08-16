import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'launchpad_state.dart';

class LaunchpadCubit extends HydratedCubit<LaunchpadState> {
  LaunchpadCubit() : super(LaunchpadState.talks);

  void toggleTab(int index) => emit(LaunchpadState.values[index]);

  @override
  LaunchpadState? fromJson(Map<String, dynamic> json) {
    return LaunchpadState.values[json['index'] as int];
  }

  @override
  Map<String, dynamic>? toJson(LaunchpadState state) => {'index': state.index};
}
