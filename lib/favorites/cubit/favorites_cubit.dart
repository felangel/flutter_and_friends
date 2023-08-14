import 'package:conference_repository/conference_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'favorites_state.dart';

class FavoritesCubit extends HydratedCubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState());

  void toggleFavorite(Talk talk) {
    final talks = [...state.talks];
    talks.contains(talk) ? talks.remove(talk) : talks.add(talk);
    emit(state.copyWith(talks: talks));
  }

  @override
  FavoritesState? fromJson(Map<String, dynamic> json) {
    final talks = (json['talks'] as List)
        .map((e) => Talk.fromJson(e as Map<String, dynamic>))
        .toList();
    return FavoritesState(talks: talks);
  }

  @override
  Map<String, dynamic>? toJson(FavoritesState state) {
    return {'talks': state.talks.map((e) => e.toJson()).toList()};
  }
}
