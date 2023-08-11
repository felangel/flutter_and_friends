import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoritesView();
  }
}

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoritesListView();
  }
}

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) => const FavoriteItem(),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.fromLTRB(18, 0, 18, 18),
          child: Placeholder(),
        ),
      ),
    );
  }
}
