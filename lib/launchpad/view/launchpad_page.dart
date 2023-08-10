import 'package:flutter/material.dart';
import 'package:flutter_and_friends/launchpad/launchpad.dart';
import 'package:flutter_and_friends/settings/settings.dart';
import 'package:flutter_and_friends/talks/talks.dart';
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
        title: const Text('Flutter & Friends'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.of(context).push(SettingsPage.route()),
          )
        ],
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
      case LaunchpadState.sponsors:
        return Container();
    }
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LaunchpadCubit>().state;
    return BottomNavigationBar(
      enableFeedback: true,
      onTap: (index) => context.read<LaunchpadCubit>().tabTapped(index),
      currentIndex: state.index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Talks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Sponsors',
        ),
      ],
    );
  }
}
