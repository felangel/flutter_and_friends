import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzle_leaderboard/puzzle_leaderboard.dart';
import 'package:flutter_and_friends/puzzles/puzzles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle_repository/puzzle_repository.dart';

class LeaderboardItem extends StatelessWidget {
  const LeaderboardItem({
    required this.user,
    required this.position,
    super.key,
  });

  final User user;
  final int position;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentUser = context.read<PuzzlesCubit>().state.user!;
    final isCurrentUserData = currentUser.userID == user.userID;
    return LeaderboardItemWrapper(
      isHighlighted: isCurrentUserData,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                position.rankEmoji,
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
          Expanded(
            child: Text(
              user.username,
              style: theme.textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: Text(
              ' ${user.totalScore}',
              style: theme.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}

extension on int {
  String get rankEmoji {
    return switch (this) { 1 => '🏆', 2 => '🥈', 3 => '🥉', _ => '$this' };
  }
}
