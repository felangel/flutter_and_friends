import 'package:conference_repository/conference_repository.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text('Talk')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          CircleAvatar(
            radius: 96,
            child: Image.network(
              'https://api.dicebear.com/6.x/avataaars/png?seed=${talk.name}',
            ),
          ),
          Text(
            talk.topic,
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            talk.name,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            talk.duration,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelSmall,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Chip(
                label: Text(talk.level),
                labelStyle: theme.textTheme.bodySmall,
              ),
              const SizedBox(width: 8),
              Chip(
                label: Text(talk.topics),
                labelStyle: theme.textTheme.bodySmall,
              )
            ],
          ),
          const SizedBox(height: 8),
          // Text(talk.twitter),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date & Time',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(talk.slot),
                const SizedBox(height: 8),
                Text(
                  'Description',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(talk.pitch),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
