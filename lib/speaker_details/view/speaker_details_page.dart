import 'package:flutter/material.dart';
import 'package:flutter_and_friends/speakers/speakers.dart';
import 'package:flutter_and_friends/twitter/twitter.dart';

class SpeakerDetailsPage extends StatelessWidget {
  const SpeakerDetailsPage({required this.speaker, super.key});

  static Route<void> route({required Speaker speaker}) {
    return MaterialPageRoute(
      builder: (_) => SpeakerDetailsPage(speaker: speaker),
    );
  }

  final Speaker speaker;

  @override
  Widget build(BuildContext context) => SpeakerDetailsView(speaker: speaker);
}

class SpeakerDetailsView extends StatelessWidget {
  const SpeakerDetailsView({required this.speaker, super.key});

  final Speaker speaker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Image.asset('assets/logo.png', height: kToolbarHeight + 8),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        children: [
          SpeakerInfo(speaker: speaker),
          const SizedBox(height: 32),
          Text(speaker.bio),
        ],
      ),
    );
  }
}

class SpeakerInfo extends StatelessWidget {
  const SpeakerInfo({required this.speaker, super.key});

  final Speaker speaker;

  @override
  Widget build(BuildContext context) {
    const avatarSize = 192.0;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
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
                    speaker.avatar,
                    width: avatarSize,
                    height: avatarSize,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (speaker.twitter != null)
                Positioned(
                  bottom: 0,
                  child: Transform.translate(
                    offset: const Offset(avatarSize / 3, 0),
                    child: TwitterIconButton(handle: speaker.twitter!),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            speaker.name,
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            speaker.title,
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
