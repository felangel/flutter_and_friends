import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzles/cubit/puzzles_cubit.dart';
import 'package:flutter_and_friends/puzzles/widgets/time_counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

class PuzzleLocked extends StatelessWidget {
  const PuzzleLocked({
    required this.unlockTime,
    super.key,
  });

  final DateTime unlockTime;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.4,
          child: const RiveAnimation.asset(
            'assets/rive/timer.riv',
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(height: 20),
        TimeCounter(
          date: unlockTime,
          text: 'Unlocks in',
          refreshPuzzles: () {
            context.read<PuzzlesCubit>().fetchPuzzles();
          },
        ),
        const SizedBox(height: 20),
        Icon(
          Icons.lock,
          size: 42,
          color: theme.colorScheme.outline,
        ),
      ],
    );
  }
}
