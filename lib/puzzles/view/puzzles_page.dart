import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzles/puzzles.dart';
import 'package:flutter_and_friends/theme/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle_repository/puzzle_repository.dart';

class PuzzlesPage extends StatelessWidget {
  const PuzzlesPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PuzzlesPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PuzzlesCubit(
        puzzleRepository: context.read<PuzzleRepository>(),
      ),
      child: const PuzzlesView(),
    );
  }
}

class PuzzlesView extends StatelessWidget {
  const PuzzlesView({super.key});
  @override
  Widget build(BuildContext context) {
    return PuzzleListener(
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: FFAppBar.empty(),
        body: const PuzzlesPageContent(),
      ),
    );
  }
}
