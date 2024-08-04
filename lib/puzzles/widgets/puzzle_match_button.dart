import 'package:flutter/material.dart';

class PuzzleMatchButton extends StatelessWidget {
  const PuzzleMatchButton({
    required this.text,
    this.onTap,
    this.color,
    super.key,
  });

  final String text;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(4),
      child: MaterialButton(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: onTap,
        padding: EdgeInsets.zero,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: const Border(
              bottom: BorderSide(width: 2),
              left: BorderSide(),
              right: BorderSide(),
              top: BorderSide(),
            ),
          ),
          child: Text(text, style: theme.textTheme.bodySmall),
        ),
      ),
    );
  }
}
