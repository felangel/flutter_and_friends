import 'package:flutter/material.dart';

class PuzzleButton extends StatelessWidget {
  const PuzzleButton({
    required this.text,
    super.key,
    this.onTap,
    this.disable = false,
  });

  final VoidCallback? onTap;
  final String text;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: disable
            ? theme.colorScheme.primaryContainer.withOpacity(0.3)
            : theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      onPressed: disable ? null : onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 2,
        ),
        child: Text(
          text,
          style: theme.textTheme.titleSmall?.copyWith(
            color: disable
                ? theme.colorScheme.onPrimaryContainer.withOpacity(0.5)
                : theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
