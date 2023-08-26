import 'package:flutter_and_friends/schedule/schedule.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'favorites_state.dart';

class FavoritesCubit extends HydratedCubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState());

  void toggleFavorite(Event event) {
    final events = [...state.events];
    events.contains(event) ? events.remove(event) : events.add(event);
    emit(state.copyWith(events: events));
  }

  @override
  FavoritesState? fromJson(Map<String, dynamic> json) {
    final events = (json['events'] as List)
        .map((e) => Event.fromJson(e as Map<String, dynamic>))
        .toList();
    return FavoritesState(events: events);
  }

  @override
  Map<String, dynamic>? toJson(FavoritesState state) {
    return {'events': state.events.map(Event.toJson).toList()};
  }
}
