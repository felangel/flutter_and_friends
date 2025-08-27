import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_and_friends/friends_badge/friends_badge.dart';
import 'package:friends_badge/friends_badge.dart';

class WriteToBadgeButton extends StatelessWidget {
  const WriteToBadgeButton(this.state, {super.key});

  final FriendsBadgeState state;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Write to badge',
      onPressed: () async {
        try {
          await WaitingForNfcTap.showLoading(
            context: context,
            job: state.image.writeToBadge(
              kernel: state.ditherKernel,
            ),
          );
        } on PlatformException {
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Error writing to badge, please restart the app and try again.',
              ),
            ),
          );
        }
      },
      child: const Icon(Icons.add_to_home_screen_outlined),
    );
  }
}
