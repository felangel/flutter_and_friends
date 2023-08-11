import 'package:flutter/material.dart';

class SponsorsPage extends StatelessWidget {
  const SponsorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SponsorsView();
  }
}

class SponsorsView extends StatelessWidget {
  const SponsorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SponsorsListView();
  }
}

class SponsorsListView extends StatelessWidget {
  const SponsorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) => const SponsorItem(),
    );
  }
}

class SponsorItem extends StatelessWidget {
  const SponsorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.fromLTRB(18, 0, 18, 18),
          child: Placeholder(),
        ),
      ),
    );
  }
}
