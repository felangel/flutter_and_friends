import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzle_user/puzzle_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PuzzleUserSheet extends StatelessWidget {
  const PuzzleUserSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PuzzleUserCubit(),
      child: const PuzzleUserSheetView(),
    );
  }
}

class PuzzleUserSheetView extends StatelessWidget {
  const PuzzleUserSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final puzzleUserCubit = context.read<PuzzleUserCubit>();
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
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
              const Text(
                'Input username',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              UsernameInput(
                onChanged: puzzleUserCubit.updateUsername,
              ),
              const SizedBox(height: 12),
              const UserSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
