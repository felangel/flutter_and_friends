import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzle_completion/view/puzzle_completion.dart';
import 'package:flutter_and_friends/puzzle_user/view/view.dart';
import 'package:flutter_and_friends/puzzles/puzzles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested_scroll_views/material.dart';

class PuzzlesPageContent extends StatefulWidget {
  const PuzzlesPageContent({super.key});

  @override
  State<PuzzlesPageContent> createState() => _PuzzlesPageContentState();
}

class _PuzzlesPageContentState extends State<PuzzlesPageContent> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    fetchPuzzles();
  }

  void fetchPuzzles() {
    final puzzlesCubit = context.read<PuzzlesCubit>();
    if (puzzlesCubit.state.userVerificationStatus ==
        UserVerificationStatus.verified) {
      puzzlesCubit.fetchPuzzles();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzlesCubit, PuzzlesState>(
      buildWhen: (previous, current) =>
          previous.userVerificationStatus != current.userVerificationStatus ||
          previous.puzzlesFetchingStatus != current.puzzlesFetchingStatus,
      builder: (context, state) {
        if (!state.hasUser) return const PuzzleUserSheet();
        return switch (state.puzzlesFetchingStatus) {
          FetchStatus.notFetched => const SizedBox.shrink(),
          FetchStatus.fetching => const Center(
              child: PuzzleLoading(),
            ),
          FetchStatus.failed => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Failed to fetch your puzzles!\nPlease try again.',
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      context.read<PuzzlesCubit>().fetchPuzzles();
                    },
                  ),
                ],
              ),
            ),
          FetchStatus.fetched => NestedPageView.builder(
              controller: _pageController,
              itemCount: state.puzzles!.length + 1,
              scrollDirection: Axis.vertical,
              wantKeepAlive: false,
              onPageChanged: (_) {
                FocusScope.of(context).unfocus();
              },
              itemBuilder: (context, pageIndex) {
                if (pageIndex == 0) return const PuzzleHome();
                final index = pageIndex - 1;
                return BlocBuilder<PuzzlesCubit, PuzzlesState>(
                  buildWhen: (previous, current) =>
                      previous.currentPuzzleSubmissionStatus !=
                          current.currentPuzzleSubmissionStatus &&
                      previous.puzzles?[index].progress !=
                          current.puzzles?[index].progress,
                  builder: (context, state) {
                    final puzzle = state.puzzles![index];
                    return PuzzleCard(
                      puzzle: puzzle,
                      showNextPuzzle: () {
                        if (pageIndex < state.puzzles!.length) {
                          _pageController.animateToPage(
                            pageIndex + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        } else {
                          final incompleteIndex = state.puzzles?.indexWhere(
                            (e) => (e.progress?.score ?? 0) == 0,
                          );
                          if (incompleteIndex == -1) {
                            Navigator.of(context)
                                .pushReplacement(PuzzleCompletion.route());
                          } else {
                            _pageController.animateToPage(
                              (incompleteIndex ?? 0) + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          }
                        }
                      },
                    );
                  },
                );
              },
            ),
        };
      },
    );
  }
}
