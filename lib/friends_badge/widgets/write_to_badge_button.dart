import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_and_friends/friends_badge/friends_badge.dart';
import 'package:friends_badge/friends_badge.dart';
import 'package:nfc_manager/nfc_manager.dart';

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
          await NfcManager.instance.stopSession();
          if (!context.mounted) return;
          await WaitingForNfcTap.showLoading(
            context: context,
            job: badge.image.writeToBadge(kernel: badge.ditherKernel),
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
      child: const Icon(Icons.nfc),
    );
  }
}
