import 'package:flutter/material.dart';

class LeaderboardItemWrapper extends StatelessWidget {
  const LeaderboardItemWrapper({
    required this.child,
    this.isHighlighted = false,
    super.key,
  });

  final Widget child;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isHighlighted
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurface.withOpacity(0.2);
    final defaultBorderSide = BorderSide(
      color: color,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border(
          bottom: BorderSide(width: 3, color: color),
          left: defaultBorderSide,
          right: defaultBorderSide,
          top: defaultBorderSide,
        ),
      ),
      child: child,
    );
  }
}
