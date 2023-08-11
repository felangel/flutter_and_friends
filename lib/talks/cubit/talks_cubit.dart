import 'package:bloc/bloc.dart';
import 'package:conference_repository/conference_repository.dart';
import 'package:equatable/equatable.dart';

part 'talks_state.dart';

class TalksCubit extends Cubit<TalksState> {
  TalksCubit({required ConferenceRepository conferenceRepository})
      : _conferenceRepository = conferenceRepository,
        super(const TalksState());

  final ConferenceRepository _conferenceRepository;

  void getTalks() {
    emit(TalksState(talks: _conferenceRepository.getTalks()));
  }
}
