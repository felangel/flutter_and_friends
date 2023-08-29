import 'package:flutter/material.dart';
import 'package:flutter_and_friends/favorites/favorites.dart';
import 'package:flutter_and_friends/location/location.dart';
import 'package:flutter_and_friends/schedule/schedule.dart';
import 'package:flutter_and_friends/twitter/twitter.dart';
import 'package:intl/intl.dart';

class WorkshopDetailsPage extends StatelessWidget {
  const WorkshopDetailsPage({required this.workshop, super.key});

  static Route<void> route({required Workshop workshop}) {
    return MaterialPageRoute(
      builder: (_) => WorkshopDetailsPage(workshop: workshop),
    );
  }

  final Workshop workshop;

  @override
  Widget build(BuildContext context) => WorkshopDetailsView(workshop: workshop);
}

class WorkshopDetailsView extends StatelessWidget {
  const WorkshopDetailsView({required this.workshop, super.key});

  final Workshop workshop;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const avatarSize = 192.0;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Image.asset('assets/logo.png', height: kToolbarHeight + 8),
        ),
        actions: [FavoriteButton(event: workshop)],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: avatarSize / 2,
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(avatarSize / 2),
                  child: Image.asset(
                    workshop.speaker.avatar,
                    width: avatarSize,
                    height: avatarSize,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              if (workshop.speaker.twitter != null)
                Positioned(
                  bottom: 0,
                  child: Transform.translate(
                    offset: const Offset(avatarSize / 3, 0),
                    child: TwitterIconButton(handle: workshop.speaker.twitter!),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            workshop.speaker.name,
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            workshop.speaker.title,
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Text(
            workshop.name,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 8,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.calendar_today, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    workshop.startTime.prettyPrint(context),
                    style: theme.textTheme.labelMedium,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.schedule, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    '${workshop.duration.inMinutes}m',
                    style: theme.textTheme.labelSmall,
                  ),
                ],
              ),
              LocationDetails(location: workshop.location),
            ],
          ),
          const SizedBox(height: 24),
          Text(workshop.description),
        ],
      ),
    );
  }
}

extension on DateTime {
  String prettyPrint(BuildContext context) {
    return '''${DateFormat.MMMd().format(this)}, ${TimeOfDay.fromDateTime(this).format(context)}''';
  }
}
