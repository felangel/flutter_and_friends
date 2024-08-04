import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzles/puzzles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle_repository/puzzle_repository.dart';

class PuzzleSingleChoice extends StatefulWidget {
  const PuzzleSingleChoice({required this.puzzle, super.key});

  final Puzzle puzzle;

  @override
  State<PuzzleSingleChoice> createState() => _PuzzleSingleChoiceState();
}

class _PuzzleSingleChoiceState extends State<PuzzleSingleChoice> {
  final foxController = FoxController(audioType: AudioType.singleChoice);
  String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
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
          values: widget.puzzle.choices ?? [],
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
                  context.read<PuzzlesCubit>().submitAnswer(
                        puzzleId: widget.puzzle.id,
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
