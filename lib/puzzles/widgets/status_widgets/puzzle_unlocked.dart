import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzles/puzzles.dart';
import 'package:puzzle_repository/puzzle_repository.dart';

class PuzzleUnlocked extends StatelessWidget {
  const PuzzleUnlocked({
    required this.puzzle,
    this.showNextPuzzle,
    super.key,
  });

  final Puzzle puzzle;
  final VoidCallback? showNextPuzzle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (puzzle.title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              puzzle.title,
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        if (puzzle.question.isNotEmpty)
          Text(
            puzzle.question,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        const SizedBox(height: 12),
        switch (puzzle.type) {
          PuzzleType.input => PuzzleInput(puzzle: puzzle),
          PuzzleType.singleChoice => PuzzleSingleChoice(puzzle: puzzle),
          PuzzleType.matching => PuzzleMatch(puzzle: puzzle),
        },
        if (showNextPuzzle != null)
          TextButton(
            onPressed: showNextPuzzle,
            child: const Text('Skip'),
          ),
        if (puzzle.progress?.score == 0) ...[
          const SizedBox(height: 22),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cancel_rounded,
                color: Colors.red,
              ),
              SizedBox(width: 4),
              Text(
                "Sorry, that's the wrong answer",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
