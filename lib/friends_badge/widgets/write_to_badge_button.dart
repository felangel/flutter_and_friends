import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_and_friends/friends_badge/friends_badge.dart';
import 'package:friends_badge/friends_badge.dart';

class WriteToBadgeButton extends StatelessWidget {
  const WriteToBadgeButton(this.badge, {super.key});

  final FriendsBadge badge;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'WriteToBadgeButton',
      tooltip: 'Write to badge',
      onPressed: () async {
        try {
          if (!context.mounted) return;
          await WaitingForNfcTap.showLoading(
            context: context,
            job: badge.image.writeToBadge(kernel: badge.ditherKernel),
          );
        } on PlatformException catch (e) {
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '''
Error writing to badge, please restart the app and try again.
Error: $e''',
              ),
            ),
          );
        }
      },
      child: const Icon(Icons.nfc),
    );
  }
}
