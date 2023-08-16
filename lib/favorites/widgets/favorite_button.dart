import 'package:flutter/material.dart';
import 'package:flutter_and_friends/favorites/favorites.dart';
import 'package:flutter_and_friends/talks/talks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({required this.talk, super.key});

  final Talk talk;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FavoritesCubit, FavoritesState, bool>(
      selector: (state) => state.talks.contains(talk),
      builder: (context, isFavorite) => IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.pinkAccent : null,
        ),
        onPressed: () {
          context.read<FavoritesCubit>().toggleFavorite(talk);
        },
      ),
    );
  }
}
