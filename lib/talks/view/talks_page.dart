import 'package:flutter/material.dart';
import 'package:flutter_and_friends/talks/talks.dart';

class TalksPage extends StatelessWidget {
  const TalksPage({super.key});

  @override
  Widget build(BuildContext context) => TalksView(talks: talks);
}

class TalksView extends StatelessWidget {
  const TalksView({required this.talks, super.key});

  final List<Talk> talks;

  @override
  Widget build(BuildContext context) => TalksListView(talks: talks);
}

class TalksListView extends StatelessWidget {
  const TalksListView({required this.talks, super.key});

  final List<Talk> talks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      padding: const EdgeInsets.all(12),
      itemCount: talks.length,
      itemBuilder: (context, index) => TalkCard(talk: talks[index]),
    );
  }
}
