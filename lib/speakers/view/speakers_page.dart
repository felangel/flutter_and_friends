import 'package:flutter/material.dart';
import 'package:flutter_and_friends/speakers/speakers.dart';
import 'package:flutter_and_friends/theme/theme.dart';

class SpeakersPage extends StatelessWidget {
  const SpeakersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FFAppBar(),
      body: const SpeakersView(),
    );
  }
}

class SpeakersView extends StatelessWidget {
  const SpeakersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpeakersListView(speakers: speakers);
  }
}

class SpeakersListView extends StatelessWidget {
  const SpeakersListView({required this.speakers, super.key});

  final List<Speaker> speakers;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      padding: const EdgeInsets.all(12),
      itemCount: speakers.length,
      itemBuilder: (context, index) => SpeakerCard(speaker: speakers[index]),
    );
  }
}
