import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzles/cubit/puzzles_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PuzzleListener extends StatelessWidget {
  const PuzzleListener({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // listener to fetch leaderboard on new user
        BlocListener<PuzzlesCubit, PuzzlesState>(
          listenWhen: (previous, current) =>
              previous.userVerificationStatus !=
                  current.userVerificationStatus &&
              current.userVerificationStatus == UserVerificationStatus.verified,
          listener: (context, state) =>
              context.read<PuzzlesCubit>().fetchPuzzles(),
        ),
      ],
      child: child,
    );
  }
}
