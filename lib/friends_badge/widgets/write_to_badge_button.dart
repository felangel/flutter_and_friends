import 'package:flutter/material.dart';
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
        await WaitingForNfcTap.showLoading(
          context: context,
          job: FriendsBadge.nfcBadgeRepository.writeOverNfc(
            state.image,
            kernel: state.ditherKernel,
          ),
        );
      },
      child: const Icon(Icons.nfc),
    );
  }
}
