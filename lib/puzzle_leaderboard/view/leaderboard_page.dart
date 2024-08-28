import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzle_leaderboard/puzzle_leaderboard.dart';
import 'package:flutter_and_friends/puzzles/puzzles.dart';
import 'package:flutter_and_friends/theme/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:puzzle_repository/puzzle_repository.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LeaderboardPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PuzzlesCubit(
        puzzleRepository: context.read<PuzzleRepository>(),
      )..fetchLeaderboard(isNew: true),
      child: const LeaderboardView(),
    );
  }
}

class LeaderboardView extends StatelessWidget {
  const LeaderboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: FFAppBar.empty(),
      body: BlocBuilder<PuzzlesCubit, PuzzlesState>(
        buildWhen: (previous, current) =>
            previous.leaderboardFetchingStatus !=
            current.leaderboardFetchingStatus,
        builder: (context, state) {
          if (state.initialLeaderboardFetched) {
            if (state.leaderboard!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(600),
                        child: Lottie.asset(
                          'assets/lotties/empty.json',
                          width: MediaQuery.of(context).size.width * 0.7,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Looks like you are the first one here.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            }

            return InfiniteList(
              itemCount: state.leaderboard!.length,
              isLoading: state.fetchingLeaderboard,
              onFetchData: () =>
                  context.read<PuzzlesCubit>().fetchLeaderboard(),
              hasReachedMax: !state.hasMoreLeaderboardData,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) => LeaderboardItem(
                user: state.leaderboard![index],
                position: index + 1,
              ),
            );
          }

          return switch (state.leaderboardFetchingStatus) {
            FetchStatus.notFetched => const SizedBox.shrink(),
            FetchStatus.fetched => const SizedBox.shrink(),
            FetchStatus.fetching => const Center(child: PuzzleLoading()),
            FetchStatus.failed => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Failed to fetch leaderboard!\nPlease try again.',
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () => context
                          .read<PuzzlesCubit>()
                          .fetchLeaderboard(isNew: true),
                    ),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
