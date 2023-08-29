import 'package:flutter/material.dart';
import 'package:flutter_and_friends/settings/settings.dart';
import 'package:flutter_and_friends/theme/theme.dart';
import 'package:flutter_and_friends/updater/updater.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SettingsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit()..init(),
      child: const SettingsView(),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headingStyle = theme.textTheme.titleMedium;
    return BlocListener<UpdaterCubit, UpdaterState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == UpdaterStatus.idle,
      listener: (context, state) {
        if (!state.updateAvailable) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('No update available'),
              ),
            );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          children: [
            Text('Preferences', style: headingStyle),
            const ThemeToggle(),
            const SizedBox(height: 16),
            Text('About', style: headingStyle),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Version'), AppVersion()],
              ),
              onTap: () => context.read<UpdaterCubit>().checkForUpdates(),
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
                applicationIcon: Image.asset('assets/logo.png', height: 120),
                applicationName: 'Flutter & Friends',
              ),
            ),
            ListTile(
              title: const Text('Developed By Felix Angelov'),
              subtitle: const Text('Powered by Shorebird'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => launchUrlString('https://shorebird.dev'),
            ),
          ],
        ),
      ),
    );
  }
}

class AppVersion extends StatelessWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context) {
    final version = context.select(
      (SettingsCubit cubit) {
        final state = cubit.state;
        final packageVersion =
            '''${state.version.major}.${state.version.minor}.${state.version.patch}''';
        final buildNumber = '${state.version.build.singleOrNull ?? 0}';
        final patchNumber =
            state.patchNumber != null ? ' #${state.patchNumber}' : '';
        return '$packageVersion ($buildNumber)$patchNumber';
      },
    );
    return Text(version);
  }
}

class AppPatchNumber extends StatelessWidget {
  const AppPatchNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final patchNumber = context.select(
      (SettingsCubit cubit) => '${cubit.state.patchNumber ?? 0}',
    );
    return Text(patchNumber);
  }
}
