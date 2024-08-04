import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzles/puzzles.dart';
import 'package:puzzle_repository/puzzle_repository.dart';

class PuzzleCard extends StatelessWidget {
  const PuzzleCard({
    required this.puzzle,
    this.showNextPuzzle,
    super.key,
  });

  final Puzzle puzzle;
  final VoidCallback? showNextPuzzle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          margin: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(1, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Quiz - ',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    height: 42,
                    width: 42,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: theme.colorScheme.primary,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.05),
                        width: 4,
                      ),
                    ),
                    child: Text(
                      (puzzle.index + 1).toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
              FutureBuilder(
                future: puzzle.puzzleStatus,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const SizedBox.shrink();
                  switch (snapshot.data!) {
                    case PuzzleStatus.locked:
                      return PuzzleLocked(unlockTime: puzzle.unlockTime);
                    case PuzzleStatus.unlocked:
                      return PuzzleUnlocked(
                        puzzle: puzzle,
                        showNextPuzzle: showNextPuzzle,
                      );
                    case PuzzleStatus.completed:
                      return PuzzleCompleted(
                        puzzle: puzzle,
                        showNextPuzzle: showNextPuzzle,
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
