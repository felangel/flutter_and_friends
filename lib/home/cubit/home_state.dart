part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoadInProgress extends HomeState {
  const HomeLoadInProgress();
}

final class HomeLoadSuccess extends HomeState {
  const HomeLoadSuccess({required this.talks});

  final List<Talk> talks;
}

final class HomeLoadFailure extends HomeState {
  const HomeLoadFailure({required this.message});

  final String message;
}
