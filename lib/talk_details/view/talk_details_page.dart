import 'package:conference_repository/conference_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_and_friends/favorites/favorites.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
          BlocSelector<FavoritesCubit, FavoritesState, bool>(
            selector: (state) => state.talks.contains(talk),
            builder: (context, isFavorite) => IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.pinkAccent : null,
              ),
              onPressed: () {
                context.read<FavoritesCubit>().toggleFavorite(talk);
              },
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 72,
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(72),
                  child: Image.network(talk.speaker.avatar),
                ),
              ),
              if (talk.speaker.twitter != null)
                Positioned(
                  bottom: 0,
                  right: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: ColoredBox(
                      color: Colors.lightBlueAccent,
                      child: IconButton(
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
            ],
          ),
          const SizedBox(height: 8),
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
          const SizedBox(height: 24),
          Text(
            talk.name,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Icon(Icons.calendar_today, size: 18),
              const SizedBox(width: 4),
              Text(
                DateFormat.Hm().format(talk.startTime),
                style: theme.textTheme.labelMedium,
              ),
              const SizedBox(width: 8),
              const Icon(Icons.schedule, size: 18),
              const SizedBox(width: 4),
              Text(
                '${talk.duration.inMinutes} minutes',
                style: theme.textTheme.labelSmall,
              ),
              const SizedBox(width: 8),
              const Icon(Icons.pin_drop_outlined, size: 18),
              const SizedBox(width: 4),
              Text(
                talk.location,
                style: theme.textTheme.labelSmall,
              ),
            ],
          ),
          const SizedBox(height: 8),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
