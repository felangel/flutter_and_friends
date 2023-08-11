import 'package:conference_repository/conference_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_and_friends/talk_details/talk_details.dart';
import 'package:flutter_and_friends/talks/talks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TalksPage extends StatelessWidget {
  const TalksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TalksCubit(
        conferenceRepository: context.read<ConferenceRepository>(),
      )..getTalks(),
      child: const TalksView(),
    );
  }
}

class TalksView extends StatelessWidget {
  const TalksView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TalksCubit>().state;
    return switch (state) {
      TalksLoadInProgress() => const LoadingIndicator(),
      TalksLoadSuccess() => TalksListView(talks: state.talks),
      TalksLoadFailure() => Center(child: Text(state.message)),
    };
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class TalksListView extends StatelessWidget {
  const TalksListView({required this.talks, super.key});

  final List<Talk> talks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: talks.length,
      itemBuilder: (context, index) => TalkItem(talk: talks[index]),
    );
  }
}

class TalkItem extends StatelessWidget {
  const TalkItem({required this.talk, super.key});

  final Talk talk;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    talk.slot,
                    style: theme.textTheme.labelMedium,
                  ),
                  const IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: null,
                  )
                ],
              ),
              Text(
                talk.topic,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(talk.avatar),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      talk.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(TalkDetailsPage.route(talk: talk));
        },
      ),
    );
  }
}
