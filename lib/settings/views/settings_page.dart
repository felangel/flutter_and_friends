import 'package:flutter/material.dart';
import 'package:flutter_and_friends/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SettingsPage());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headingStyle = theme.textTheme.titleMedium;
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          Text('Preferences', style: headingStyle),
          const ThemeToggle(),
          const SizedBox(height: 16),
          Text('About', style: headingStyle),
          const ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Version'), Text('1.0.0 (1)')],
            ),
          ),
          const ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Author'), Text('Felix Angelov')],
            ),
          ),
          ListTile(
            title: const Text('Source Code'),
            subtitle: const Text('View the full source code on GitHub'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => launchUrlString(
              'https://github.com/felangel/flutter_and_friends',
            ),
          ),
          ListTile(
            title: const Text('Licenses'),
            subtitle: const Text('View the licenses of the libraries used'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => showLicensePage(
              context: context,
              applicationIcon: Image.asset(
                'assets/logo.png',
                height: 120,
              ),
              applicationName: 'Flutter & Friends',
              applicationVersion: '1.0.0 (1)',
            ),
          ),
        ],
      ),
    );
  }
}

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeCubit>().state;
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
