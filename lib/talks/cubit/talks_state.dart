part of 'talks_cubit.dart';

final class TalksState extends Equatable {
  const TalksState({this.talks = const []});

  final List<Talk> talks;

  @override
  List<Object> get props => [talks];
}
