import 'package:bloc/bloc.dart';
import 'package:conference_repository/conference_repository.dart';
import 'package:equatable/equatable.dart';

part 'talks_state.dart';

class TalksCubit extends Cubit<TalksState> {
  TalksCubit({required ConferenceRepository conferenceRepository})
      : _conferenceRepository = conferenceRepository,
        super(const TalksLoadInProgress());

  final ConferenceRepository _conferenceRepository;

  Future<void> getTalks() async {
    emit(const TalksLoadInProgress());
    try {
      final talks = await _conferenceRepository.getTalks();
      emit(TalksLoadSuccess(talks: talks));
    } on GetTalksException catch (error) {
      emit(TalksLoadFailure(message: error.message));
    }
  }
}
