import 'package:flutter/material.dart';
import 'package:flutter_and_friends/extensions/extensions.dart';
import 'package:flutter_and_friends/favorites/favorites.dart';
import 'package:flutter_and_friends/location/location.dart';
import 'package:flutter_and_friends/schedule/schedule.dart';
import 'package:flutter_and_friends/workshop_details/workshop_details.dart';

class WorkshopCard extends StatelessWidget {
  const WorkshopCard({required this.workshop, super.key});

  final Workshop workshop;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          WorkshopDetailsPage.route(workshop: workshop),
        ),
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
                        workshop.startTime.prettyPrint(
                          context,
                          workshop.duration,
                        ),
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  FavoriteButton(event: workshop),
                ],
              ),
              Text(
                workshop.name,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              ...workshop.speakers.map(
                (speaker) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(speaker.avatar),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              speaker.name,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            Text(
                              speaker.title,
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LocationDetails(location: workshop.location),
                  const Text('Workshop'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
