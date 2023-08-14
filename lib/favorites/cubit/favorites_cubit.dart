import 'package:bloc/bloc.dart';
import 'package:conference_repository/conference_repository.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState());

  void toggleFavorite(Talk talk) {
    final talks = state.talks.contains(talk)
        ? state.talks.where((t) => t.name != talk.name).toList()
        : [...state.talks, talk];
    emit(state.copyWith(talks: talks));
  }
}
