import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzles/puzzles.dart';
import 'package:puzzle_repository/puzzle_repository.dart';

class PuzzleCompleted extends StatelessWidget {
  const PuzzleCompleted({
    required this.puzzle,
    this.showNextPuzzle,
    super.key,
  });

  final Puzzle puzzle;
  final VoidCallback? showNextPuzzle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 150,
          child: FoxAnimation(
            startInitial: true,
            rivePath: 'assets/rive/fox_head_animation.riv',
            controller: FoxController(audioType: AudioType.complete),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          puzzle.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          puzzle.question,
          style: const TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 22),
        Text(
          'Your score : ${puzzle.progress!.score}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 22),
        const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 42,
        ),
        const SizedBox(height: 8),
        const Text(
          'Congratz, you completed this one.',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 22),
        PuzzleButton(
          text: 'Solve Next',
          onTap: showNextPuzzle,
        ),
      ],
    );
  }
}
