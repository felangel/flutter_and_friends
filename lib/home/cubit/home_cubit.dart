import 'package:bloc/bloc.dart';
import 'package:conference_repository/conference_repository.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required ConferenceRepository conferenceRepository})
      : _conferenceRepository = conferenceRepository,
        super(const HomeLoadInProgress());

  final ConferenceRepository _conferenceRepository;

  Future<void> getTalks() async {
    emit(const HomeLoadInProgress());
    try {
      final talks = await _conferenceRepository.getTalks();
      emit(HomeLoadSuccess(talks: talks));
    } on GetTalksException catch (error) {
      emit(HomeLoadFailure(message: error.message));
    }
  }
}
