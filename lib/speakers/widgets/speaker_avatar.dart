import 'package:flutter/material.dart';
import 'package:flutter_and_friends/speaker_details/speaker_details.dart';
import 'package:flutter_and_friends/speakers/speakers.dart';

class SpeakerAvatar extends StatelessWidget {
  const SpeakerAvatar({required this.speaker, super.key});

  final Speaker speaker;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 16,
      children: [
        InkWell(
          onTap: () => Navigator.of(context).push(
            SpeakerDetailsPage.route(speaker: speaker),
          ),
          child: Hero(
            tag: speaker.name,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(speaker.avatar),
            ),
          ),
        ),
        Column(
          children: [
            Text(
              speaker.name,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              speaker.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
