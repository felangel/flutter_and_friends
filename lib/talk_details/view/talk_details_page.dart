import 'package:conference_repository/conference_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TalkDetailsPage extends StatelessWidget {
  const TalkDetailsPage({required this.talk, super.key});

  static Route<void> route({required Talk talk}) {
    return MaterialPageRoute(
      builder: (_) => TalkDetailsPage(talk: talk),
    );
  }

  final Talk talk;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        children: [
          Text(
            talk.name,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              CircleAvatar(
                radius: 38,
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(38),
                  child: Image.network(talk.speaker.avatar),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  talk.name,
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            '${talk.duration.inMinutes} minutes',
            style: theme.textTheme.labelSmall,
          ),
          const SizedBox(height: 8),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date & Time',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(DateFormat.Hm().add_MMMMd().format(talk.startTime)),
              const SizedBox(height: 24),
              Text(
                'Description',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(talk.description),
            ],
          ),
        ],
      ),
    );
  }
}
