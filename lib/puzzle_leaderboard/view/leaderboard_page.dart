import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzle_leaderboard/puzzle_leaderboard.dart';
import 'package:flutter_and_friends/puzzles/puzzles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LeaderboardPage());
  }

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  void initState() {
    context.read<PuzzlesCubit>().fetchLeaderboard(isNew: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(),
        centerTitle: false,
        title: Text(
          'Leaderboard',
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: BlocBuilder<PuzzlesCubit, PuzzlesState>(
        buildWhen: (previous, current) =>
            previous.leaderboardFetchingStatus !=
            current.leaderboardFetchingStatus,
        builder: (context, state) {
          final puzzlesCubit = context.read<PuzzlesCubit>();
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
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              );
            }
            return InfiniteList(
              itemCount: state.leaderboard!.length,
              isLoading: state.fetchingLeaderboard,
              onFetchData: puzzlesCubit.fetchLeaderboard,
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
            // handled in above if case
            FetchStatus.fetched => const SizedBox.shrink(),
            FetchStatus.fetching => const Center(
                child: PuzzleLoading(),
              ),
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
