part of 'favorites_cubit.dart';

class FavoritesState {
  const FavoritesState({this.events = const []});

  final List<Event> events;

  FavoritesState copyWith({List<Event>? events}) {
    return FavoritesState(events: events ?? this.events);
  }
}
