import 'package:flutter/material.dart';
import 'package:flutter_and_friends/favorites/favorites.dart';
import 'package:flutter_and_friends/talk_details/talk_details.dart';
import 'package:flutter_and_friends/talks/talks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) => const FavoritesView();
}

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final talks = context.watch<FavoritesCubit>().state.talks;
    if (talks.isEmpty) return const EmptyFavorites();
    return FavoritesListView(talks: talks);
  }
}

class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.heart_broken_sharp,
              color: Colors.pinkAccent,
              size: 64,
            ),
            const SizedBox(height: 24),
            Text(
              "You don't have any favorites",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap the heart icon to add a talk to your favorites',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({required this.talks, super.key});

  final List<Talk> talks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      padding: const EdgeInsets.all(12),
      itemCount: talks.length,
      itemBuilder: (context, index) => TalkCard(
        talk: talks[index],
        onTap: () => Navigator.of(context).push(
          TalkDetailsPage.route(talk: talks[index]),
        ),
      ),
    );
  }
}
