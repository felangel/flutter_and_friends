part of 'talks_cubit.dart';

sealed class TalksState extends Equatable {
  const TalksState();

  @override
  List<Object> get props => [];
}

final class TalksLoadInProgress extends TalksState {
  const TalksLoadInProgress();
}

final class TalksLoadSuccess extends TalksState {
  const TalksLoadSuccess({required this.talks});

  final List<Talk> talks;
}

final class TalksLoadFailure extends TalksState {
  const TalksLoadFailure({required this.message});

  final String message;
}
