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
    return const SpeakersGridView(speakers: speakers);
  }
}

class SpeakersGridView extends StatelessWidget {
  const SpeakersGridView({required this.speakers, super.key});

  final List<Speaker> speakers;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.crossAxisCount,
        mainAxisSpacing: 12,
      ),
      padding: const EdgeInsets.all(12),
      itemCount: speakers.length,
      itemBuilder: (context, index) => SpeakerAvatar(speaker: speakers[index]),
    );
  }
}

extension on BuildContext {
  int get crossAxisCount {
    final width = MediaQuery.of(this).size.width;
    if (width < 600) return 2;
    if (width < 800) return 3;
    return 4;
  }
}
