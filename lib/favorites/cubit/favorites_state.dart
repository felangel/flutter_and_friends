part of 'favorites_cubit.dart';

class FavoritesState {
  const FavoritesState({this.talks = const []});

  final List<Talk> talks;

  FavoritesState copyWith({List<Talk>? talks}) {
    return FavoritesState(talks: talks ?? this.talks);
  }
}
