import 'package:flutter/material.dart';
import 'package:flutter_and_friends/favorites/favorites.dart';
import 'package:flutter_and_friends/launchpad/launchpad.dart';
import 'package:flutter_and_friends/sponsors/sponsors.dart';
import 'package:flutter_and_friends/talks/talks.dart';
import 'package:flutter_and_friends/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaunchpadPage extends StatelessWidget {
  const LaunchpadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LaunchpadCubit(),
      child: const LaunchpadView(),
    );
  }
}

class LaunchpadView extends StatelessWidget {
  const LaunchpadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/logo.png', height: kToolbarHeight),
        actions: const [ThemeToggle()],
      ),
      body: const _LaunchpadBody(),
      bottomNavigationBar: const _BottomNavigationBar(),
    );
  }
}

class _LaunchpadBody extends StatelessWidget {
  const _LaunchpadBody();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LaunchpadCubit>().state;
    switch (state) {
      case LaunchpadState.talks:
        return const TalksPage();
      case LaunchpadState.favorites:
        return const FavoritesPage();
      case LaunchpadState.sponsors:
        return const SponsorsPage();
    }
  }
}

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeCubit>().state;
    final icon = state == ThemeState.light ? Icons.dark_mode : Icons.light_mode;
    return IconButton(
      onPressed: () => context.read<ThemeCubit>().toggleTheme(),
      icon: Icon(icon),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LaunchpadCubit>().state;
    return BottomNavigationBar(
      showUnselectedLabels: false,
      enableFeedback: true,
      onTap: (index) => context.read<LaunchpadCubit>().tabTapped(index),
      currentIndex: state.index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Talks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Sponsors',
        ),
      ],
    );
  }
}
