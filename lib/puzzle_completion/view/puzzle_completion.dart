import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzle_leaderboard/puzzle_leaderboard.dart';
import 'package:flutter_and_friends/puzzles/puzzles.dart';
import 'package:flutter_and_friends/theme/theme.dart';
import 'package:rive/rive.dart';

class PuzzleCompletion extends StatelessWidget {
  const PuzzleCompletion({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PuzzleCompletion());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: FFAppBar.empty(),
      body: Stack(
        children: [
          const RiveAnimation.asset(
            'assets/rive/celebration.riv',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: FoxAnimation(
                    startInitial: true,
                    rivePath: 'assets/rive/fox_animation.riv',
                    controller: FoxController(audioType: AudioType.congrats),
                  ),
                ),
                Text(
                  'Congrats! You have completed the puzzle.',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 22),
                PuzzleButton(
                  text: 'View leaderboard',
                  onTap: () => Navigator.of(context).push(
                    LeaderboardPage.route(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
