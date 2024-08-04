import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzle_user/puzzle_user.dart';
import 'package:flutter_and_friends/puzzle_user/widgets/validity_info.dart';
import 'package:flutter_and_friends/puzzles/puzzles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSubmitButton extends StatelessWidget {
  const UserSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<PuzzlesCubit, PuzzlesState>(
      buildWhen: (previous, current) =>
          previous.userVerificationStatus != current.userVerificationStatus,
      builder: (context, puzzlesState) {
        final puzzlesCubit = context.read<PuzzlesCubit>();
        return Column(
          children: [
            if (puzzlesState.userVerificationStatus ==
                UserVerificationStatus.verifying)
              const Center(
                child: PuzzleLoading(),
              )
            else
              BlocBuilder<PuzzleUserCubit, PuzzleUserState>(
                builder: (context, puzzleUserState) {
                  return Column(
                    children: [
                      ...UsernameCharacteristics.values.map(
                        (characteristics) => ValidityInfo(
                          valid: switch (characteristics) {
                            UsernameCharacteristics.startsWithAlphabet =>
                              puzzleUserState.startsWithAlphabet,
                            UsernameCharacteristics.containsAtLeastTwoLetters =>
                              puzzleUserState.containsAtLeastTwoLetters,
                            UsernameCharacteristics.isAlphanumeric =>
                              puzzleUserState.isAlphanumeric,
                          },
                          validationMessage: characteristics.message,
                        ),
                      ),
                      const SizedBox(height: 10),
                      PuzzleButton(
                        text: 'Submit',
                        disable: !puzzleUserState.isUsernameValid ||
                            puzzlesState.userVerificationStatus ==
                                UserVerificationStatus.verifying,
                        onTap: () {
                          puzzlesCubit.verifyUser(
                            username: puzzleUserState.username,
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            if (puzzlesState.userVerificationStatus ==
                UserVerificationStatus.existingUsername)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'This username exists! Try a different name.',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.colorScheme.error),
                  textAlign: TextAlign.center,
                ),
              )
            else if (puzzlesState.userVerificationStatus ==
                UserVerificationStatus.failed)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Something went wrong! Try again.',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.colorScheme.error),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        );
      },
    );
  }
}
