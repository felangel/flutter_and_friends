import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzles/cubit/puzzles_cubit.dart';
import 'package:flutter_and_friends/puzzles/helper/puzzle_helper.dart';
import 'package:flutter_and_friends/puzzles/widgets/fox_animation.dart';
import 'package:flutter_and_friends/puzzles/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle_repository/puzzle_repository.dart';

class PuzzleSingleChoice extends StatelessWidget {
  const PuzzleSingleChoice({
    required this.puzzle,
    super.key,
  });

  final Puzzle puzzle;

  @override
  Widget build(BuildContext context) {
    final foxController = FoxController(audioType: AudioType.singleChoice);
    final puzzlesCubit = context.read<PuzzlesCubit>();
    String? selectedAnswer;

    return Column(
      children: [
        SizedBox(
          height: 160,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: FoxAnimation(
              rivePath: 'assets/rive/fox_head_animation.riv',
              controller: foxController,
            ),
          ),
        ),
        PuzzleSingleChoiceChips(
          values: puzzle.choices ?? [],
          onChanged: (answer) {
            selectedAnswer = answer;
            foxController.play();
          },
        ),
        const SizedBox(height: 22),
        BlocBuilder<PuzzlesCubit, PuzzlesState>(
          builder: (context, state) {
            return PuzzleButton(
              text: 'Submit',
              disable: state.currentPuzzleSubmissionStatus ==
                  SubmissionStatus.submitting,
              onTap: () {
                if (selectedAnswer != null) {
                  puzzlesCubit.submitAnswer(
                    puzzleId: puzzle.id,
                    answer: selectedAnswer,
                  );
                }
              },
            );
          },
        ),
      ],
    );
  }
}
