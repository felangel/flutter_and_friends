import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'puzzle_user_state.dart';

class PuzzleUserCubit extends Cubit<PuzzleUserState> {
  PuzzleUserCubit() : super(const PuzzleUserState.initial());

  void updateUsername(String username) =>
      emit(PuzzleUserState(username: username));
}
