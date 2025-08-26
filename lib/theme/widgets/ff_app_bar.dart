import 'package:flutter/material.dart';
import 'package:flutter_and_friends/friends_badge/friends_badge.dart';
import 'package:flutter_and_friends/settings/settings.dart';
import 'package:friends_badge/friends_badge.dart';

class FFAppBar extends AppBar {
  FFAppBar({super.bottom, super.key})
    : super(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Image.asset('assets/logo.png', height: kToolbarHeight + 8),
        ),
        actions: [
          if (FriendsBadge.nfcBadgeRepository.isSupported)
            const _FriendsBadgeButton(),
          const _SettingsButton(),
        ],
      );
}

class _FriendsBadgeButton extends StatelessWidget {
  const _FriendsBadgeButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Write image to Friends Badge',
      icon: const Icon(Icons.add_to_home_screen_outlined),
      onPressed: () => Navigator.of(context).push(FriendsBadgePage.route()),
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () => Navigator.of(context).push(SettingsPage.route()),
    );
  }
}
