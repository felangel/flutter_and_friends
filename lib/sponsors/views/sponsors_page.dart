import 'package:flutter/material.dart';
import 'package:flutter_and_friends/sponsors/sponsors.dart';
import 'package:flutter_and_friends/theme/theme.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SponsorsPage extends StatelessWidget {
  const SponsorsPage({super.key});

  @override
  Widget build(BuildContext context) => const SponsorsView();
}

class SponsorsView extends StatelessWidget {
  const SponsorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: FFAppBar(), body: const SponsorsListView());
  }
}

class SponsorsListView extends StatelessWidget {
  const SponsorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headingStyle = theme.textTheme.displaySmall?.copyWith(
      fontWeight: FontWeight.w300,
    );
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Text(
          'Platinum Sponsors',
          style: headingStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ...platinumSponsors.map((sponsor) => SponsorItem(sponsor: sponsor)),
        const SizedBox(height: 32),
        Text('Gold Sponsors', style: headingStyle, textAlign: TextAlign.center),
        const SizedBox(height: 16),
        ...goldSponsors.map((sponsor) => SponsorItem(sponsor: sponsor)),
        const SizedBox(height: 32),
        Text(
          'Silver Sponsors',
          style: headingStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ...silverSponsors.map((sponsor) => SponsorItem(sponsor: sponsor)),
        const SizedBox(height: 32),
        Text('Together with', style: headingStyle, textAlign: TextAlign.center),
        const SizedBox(height: 16),
        ...togetherWith.map((sponsor) => SponsorItem(sponsor: sponsor)),
        const SizedBox(height: 32),
        Text(
          'Streaming Sponsor',
          style: headingStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        const SponsorItem(sponsor: streamingSponsor),
        const SizedBox(height: 32),
        Text(
          'Party Sponsors',
          style: headingStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ...partySponsors.map((sponsor) => SponsorItem(sponsor: sponsor)),
      ],
    );
  }
}

class SponsorItem extends StatelessWidget {
  const SponsorItem({required this.sponsor, super.key});

  final Sponsor sponsor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        color: lightTheme.colorScheme.surface,
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () => launchUrlString(sponsor.url),
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: Image.asset(sponsor.logo),
            ),
          ),
        ),
      ),
    );
  }
}
