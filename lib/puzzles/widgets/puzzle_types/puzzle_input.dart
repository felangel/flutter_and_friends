import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_and_friends/puzzles/puzzles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle_repository/puzzle_repository.dart';

class PuzzleInput extends StatefulWidget {
  const PuzzleInput({
    required this.puzzle,
    super.key,
  });

  final Puzzle puzzle;

  @override
  State<PuzzleInput> createState() => _PuzzleInputState();
}

class _PuzzleInputState extends State<PuzzleInput> {
  List<FocusNode> focusNodes = [];
  List<TextEditingController> controllers = [];
  int totalLength = 0;
  final foxController = FoxController(audioType: AudioType.input);

  @override
  void initState() {
    super.initState();
    totalLength = widget.puzzle.inputFillers?.length ?? 0;

    focusNodes = List.generate(
      totalLength,
      (index) => FocusNode(),
    );

    controllers = List.generate(
      totalLength,
      (index) => TextEditingController(),
    );

    for (var i = 0; i < totalLength; i++) {
      if (widget.puzzle.inputFillers![i] != '_') {
        controllers[i].text = widget.puzzle.inputFillers![i];
      }
    }
  }

  @override
  void dispose() {
    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
        Form(
          child: Wrap(
            children: List.generate(
              widget.puzzle.inputFillers?.length ?? 0,
              (index) {
                final letter = widget.puzzle.inputFillers![index];
                if (letter == ' ') {
                  return const SizedBox(width: 16);
                }
                return Container(
                  width: 30,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: TextFormField(
                    readOnly: widget.puzzle.inputFillers![index] != '_',
                    textAlign: TextAlign.center,
                    focusNode: focusNodes[index],
                    controller: controllers[index],
                    maxLength: 1,
                    inputFormatters: [
                      UpperCaseTextFormatter(),
                    ],
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      focusColor: theme.primaryColor,
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.colorScheme.outline),
                      ),
                      counter: const SizedBox(),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < totalLength - 1) {
                        final incrementValue =
                            widget.puzzle.inputFillers![index + 1] != '_'
                                ? 2
                                : 1;
                        FocusScope.of(context)
                            .requestFocus(focusNodes[index + incrementValue]);
                      } else if (value.isEmpty && index != 0) {
                        final decrementValue =
                            widget.puzzle.inputFillers![index - 1] == ' '
                                ? 2
                                : 1;
                        FocusScope.of(context)
                            .requestFocus(focusNodes[index - decrementValue]);
                      }
                      if (value.isNotEmpty && index == totalLength - 1) {
                        foxController.play();
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 22),
        BlocBuilder<PuzzlesCubit, PuzzlesState>(
          builder: (context, state) {
            return PuzzleButton(
              text: 'Check Answer',
              disable: state.currentPuzzleSubmissionStatus ==
                  SubmissionStatus.submitting,
              onTap: () {
                final answer = StringBuffer();
                for (final controller in controllers) {
                  answer.write(controller.text);
                }
                context.read<PuzzlesCubit>().submitAnswer(
                      puzzleId: widget.puzzle.id,
                      answer: '$answer',
                    );
              },
            );
          },
        ),
      ],
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(
      text: newValue.text.toUpperCase(),
    );
  }
}
