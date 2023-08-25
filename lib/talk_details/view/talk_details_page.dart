import 'package:flutter/material.dart';
import 'package:flutter_and_friends/favorites/favorites.dart';
import 'package:flutter_and_friends/talks/talks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TalkDetailsPage extends StatelessWidget {
  const TalkDetailsPage({required this.talk, super.key});

  static Route<void> route({required Talk talk}) {
    return MaterialPageRoute(builder: (_) => TalkDetailsPage(talk: talk));
  }

  final Talk talk;

  @override
  Widget build(BuildContext context) => TalkDetailsView(talk: talk);
}

class TalkDetailsView extends StatelessWidget {
  const TalkDetailsView({required this.talk, super.key});

  final Talk talk;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const avatarSize = 192.0;
    const twitterSize = 16.0;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Image.asset('assets/logo.png', height: kToolbarHeight + 8),
        ),
        actions: [FavoriteButton(talk: talk)],
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
                    'assets/speakers/${talk.speaker.avatar}',
                    width: avatarSize,
                    height: avatarSize,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              if (talk.speaker.twitter != null)
                Positioned(
                  bottom: 0,
                  child: Transform.translate(
                    offset: const Offset(avatarSize / 3, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(twitterSize * 2),
                      child: ColoredBox(
                        color: Colors.lightBlueAccent,
                        child: IconButton(
                          iconSize: twitterSize * 1.25,
                          icon: const Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            launchUrlString(
                              'https://twitter.com/${talk.speaker.twitter}',
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            talk.speaker.name,
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            talk.speaker.title,
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Text(
            talk.name,
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
                    talk.startTime.prettyPrint(context),
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
                    '${talk.duration.inMinutes}m',
                    style: theme.textTheme.labelSmall,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_on_outlined, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    talk.location,
                    style: theme.textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(talk.description),
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
