import 'package:flutter/material.dart';

class PuzzleSingleChoiceChips extends StatefulWidget {
  const PuzzleSingleChoiceChips({
    required this.values,
    this.onChanged,
    super.key,
  });

  final List<String> values;
  final void Function(String)? onChanged;

  @override
  State<PuzzleSingleChoiceChips> createState() =>
      _PuzzleSingleChoiceChipsState();
}

class _PuzzleSingleChoiceChipsState extends State<PuzzleSingleChoiceChips> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      children: List.generate(
        widget.values.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: MaterialButton(
            color: selectedIndex == index ? theme.colorScheme.primary : null,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            onPressed: () {
              widget.onChanged?.call(widget.values[index]);
              selectedIndex = index;
              setState(() {});
            },
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
              child: Text(
                widget.values[index],
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onSecondaryContainer,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
