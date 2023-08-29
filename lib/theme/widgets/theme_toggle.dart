import 'package:flutter/material.dart';
import 'package:flutter_and_friends/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeCubit>().state;
    // FIXME: Something's not right here...
    final label = state == ThemeState.light ? 'Dark Mode' : 'Light Mode';
    final icon = state == ThemeState.light ? Icons.dark_mode : Icons.light_mode;
    return SwitchListTile(
      title: Text(label),
      value: state == ThemeState.light,
      onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
      secondary: Icon(icon),
    );
  }
}
