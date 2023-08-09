import 'package:conference_repository/conference_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_and_friends/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        conferenceRepository: context.read<ConferenceRepository>(),
      )..getTalks(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter & Friends')),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return switch (state) {
            HomeLoadInProgress() => const LoadingIndicator(),
            HomeLoadSuccess() => TalksListView(talks: state.talks),
            HomeLoadFailure() => Center(child: Text(state.message)),
          };
        },
      ),
    );
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
      itemCount: talks.length,
      itemBuilder: (context, index) {
        final talk = talks[index];
        return ListTile(
          title: Text(talk.topic),
          subtitle: Text(talk.name),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.of(context).push(TalkDetailsPage.route(talk: talk));
          },
        );
      },
    );
  }
}

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
      appBar: AppBar(title: Text(talk.topic)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            talk.topic,
            style: theme.textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          Text(talk.twitter),
          Text(talk.duration),
          Text(talk.level),
          Text(talk.slot),
          Text(talk.topics),
          Text(talk.name),
          Text(talk.pitch),
        ],
      ),
    );
  }
}
