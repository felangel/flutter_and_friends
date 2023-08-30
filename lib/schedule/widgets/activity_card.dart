import 'package:flutter/material.dart';
import 'package:flutter_and_friends/extensions/extensions.dart';
import 'package:flutter_and_friends/favorites/favorites.dart';
import 'package:flutter_and_friends/location/location.dart';
import 'package:flutter_and_friends/schedule/schedule.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({required this.activity, super.key});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
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
                      Icon(
                        Icons.calendar_today,
                        size: 18,
                        color: theme.colorScheme.secondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        activity.startTime.prettyPrint(
                          context,
                          activity.duration,
                        ),
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  FavoriteButton(event: activity),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LocationDetails(location: activity.location),
                  const Text('Activity'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
