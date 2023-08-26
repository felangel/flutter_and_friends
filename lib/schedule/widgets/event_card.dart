import 'package:flutter/material.dart';
import 'package:flutter_and_friends/favorites/favorites.dart';
import 'package:flutter_and_friends/schedule/schedule.dart';
import 'package:flutter_and_friends/talks/talks.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  const EventCard({required this.event, super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
    if (event is Talk) return TalkCard(talk: event as Talk);
    if (event is Activity) return ActivityCard(activity: event as Activity);
    return const SizedBox();
  }
}

class ActivityCard extends StatelessWidget {
  const ActivityCard({required this.activity, super.key});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      surfaceTintColor: theme.colorScheme.tertiaryContainer,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        activity.startTime.prettyPrint(context),
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  FavoriteButton(talk: talks.first),
                ],
              ),
              Row(
                children: [
                  if (activity.image != null) ...[
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(activity.image!),
                    ),
                    const SizedBox(width: 16),
                  ],
                  Expanded(
                    child: Text(
                      activity.name,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (activity.location != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: theme.colorScheme.secondary,
                    ),
                    Text(
                      activity.location!,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpeakerInfo extends StatelessWidget {
  const SpeakerInfo({required this.talk, super.key});

  final Talk talk;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(talk.speaker.avatar),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                talk.speaker.name,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                talk.speaker.title,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

extension on DateTime {
  String prettyPrint(BuildContext context) {
    return '''${DateFormat.MMMMd().format(this)}, ${TimeOfDay.fromDateTime(this).format(context)}''';
  }
}
