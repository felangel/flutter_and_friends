import 'package:conference_repository/conference_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_and_friends/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => ConferenceRepository(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
