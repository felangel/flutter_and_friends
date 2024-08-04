import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzle_leaderboard/puzzle_leaderboard.dart';
import 'package:flutter_and_friends/puzzles/helper/puzzle_helper.dart';
import 'package:flutter_and_friends/puzzles/widgets/fox_animation.dart';
import 'package:flutter_and_friends/puzzles/widgets/widgets.dart';
import 'package:flutter_and_friends/theme/theme.dart';
import 'package:lottie/lottie.dart';

class PuzzleHome extends StatelessWidget {
  const PuzzleHome({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      child: FoxAnimation(
                        startInitial: true,
                        audioPath: 'audio/intro.mp3',
                        rivePath: 'assets/rive/fox_head_animation.riv',
                        controller: FoxController(audioType: AudioType.home),
                        startDelayed: false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'FUZZLE',
                          style: theme.textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: lightTheme.colorScheme.primary,
                          ),
                        ),
                        Text(
                          'Powered by ARKROOT GmbH',
                          style: theme.textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 32),
                        PuzzleButton(
                          text: 'Leaderboard',
                          onTap: () => Navigator.of(context)
                              .push(LeaderboardPage.route()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Lottie.asset(
            'assets/lotties/swipe_up.json',
            height: 60,
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}
