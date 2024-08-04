import 'package:flutter/material.dart';
import 'package:flutter_and_friends/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeCubit>().state;
    final label = state == ThemeState.light ? 'Light Mode' : 'Dark Mode';
    final icon = state == ThemeState.light ? Icons.light_mode : Icons.dark_mode;
    return SwitchListTile(
      title: Text(label),
      value: state == ThemeState.light,
      onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
      secondary: Icon(icon),
    );
  }
}
