import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzles/cubit/puzzles_cubit.dart';
import 'package:flutter_and_friends/puzzles/helper/puzzle_helper.dart';
import 'package:flutter_and_friends/puzzles/models/models.dart';
import 'package:flutter_and_friends/puzzles/widgets/fox_animation.dart';
import 'package:flutter_and_friends/puzzles/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested_scroll_views/material.dart';
import 'package:puzzle_repository/puzzle_repository.dart';

class PuzzleMatch extends StatefulWidget {
  const PuzzleMatch({
    required this.puzzle,
    super.key,
  });

  final Puzzle puzzle;

  @override
  State<PuzzleMatch> createState() => _PuzzleMatchState();
}

class _PuzzleMatchState extends State<PuzzleMatch> {
  final foxController = FoxController(audioType: AudioType.match);

  List<MatchItem> left = [];
  List<MatchItem> right = [];

  int? lastIncompleteIndex;

  final random = Random();

  void matchingLogic(
    int index,
    List<MatchItem> thisList,
    List<MatchItem> thatList,
  ) {
    if (!thisList[index].selected) {
      int? soloIndex;
      for (var index = 0; index < thatList.length; index++) {
        if (thatList[index].selected && thatList[index].valueIndex == null) {
          soloIndex = index;
          break;
        }
      }

      if (soloIndex != null) {
        thisList[index].color = thatList[soloIndex].color;
        thisList[index].valueIndex = soloIndex;
        thatList[soloIndex].valueIndex = index;
        thisList[index].selected = true;
        lastIncompleteIndex = null;

        if (completeness) {
          foxController.play();
        }
      } else {
        if (lastIncompleteIndex != null) {
          thisList[lastIncompleteIndex!].unselect();
        }
        final colorVariance =
            Theme.of(context).brightness == Brightness.dark ? 0 : 128;
        final randomColor = Color.fromARGB(
          255,
          random.nextInt(128) + colorVariance,
          random.nextInt(128) + colorVariance,
          random.nextInt(128) + colorVariance,
        );
        thisList[index].color = randomColor;
        thisList[index].selected = true;
        lastIncompleteIndex = index;
      }
    } else {
      if (thisList[index].valueIndex != null) {
        thatList[thisList[index].valueIndex!].unselect();
      }
      thisList[index].unselect();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (widget.puzzle.matches?.isNotEmpty ?? false) {
      left =
          widget.puzzle.matches!.keys.map((e) => MatchItem(text: e)).toList();
      right =
          widget.puzzle.matches!.values.map((e) => MatchItem(text: e)).toList();
    }
  }

  bool get completeness {
    var completedAllMatches = true;
    for (final element in left) {
      if (!element.selected) {
        completedAllMatches = false;
        break;
      }
    }
    if (completedAllMatches) {
      for (final element in right) {
        if (!element.selected) {
          completedAllMatches = false;
          break;
        }
      }
    }
    return completedAllMatches;
  }

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
        NestedListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            left.length,
            (index) {
              return Row(
                children: [
                  Expanded(
                    child: PuzzleMatchButton(
                      text: left[index].text,
                      color: left[index].color,
                      onTap: () => matchingLogic(index, left, right),
                    ),
                  ),
                  Expanded(
                    child: PuzzleMatchButton(
                      color: right[index].color,
                      text: right[index].text,
                      onTap: () => matchingLogic(index, right, left),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 22),
        BlocBuilder<PuzzlesCubit, PuzzlesState>(
          builder: (context, state) {
            return PuzzleButton(
              text: 'Submit Answers',
              disable: state.currentPuzzleSubmissionStatus ==
                  SubmissionStatus.submitting,
              onTap: () {
                if (completeness) {
                  final answer = <String, String>{};
                  for (final element in left) {
                    answer.addAll(
                      {element.text: right[element.valueIndex!].text},
                    );
                  }
                  context.read<PuzzlesCubit>().submitAnswer(
                        puzzleId: widget.puzzle.id,
                        answer: '$answer',
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
