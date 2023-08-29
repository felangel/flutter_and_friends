import 'package:flutter/material.dart';
import 'package:flutter_and_friends/schedule/schedule.dart';
import 'package:flutter_and_friends/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScheduleCubit(),
      child: const ScheduleView(),
    );
  }
}

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ScheduleCubit>().state;
    return DefaultTabController(
      initialIndex: state.index,
      length: ScheduleState.values.length,
      child: Scaffold(
        appBar: FFAppBar(
          bottom: TabBar(
            onTap: (index) => context.read<ScheduleCubit>().toggleTab(index),
            tabs: const <Widget>[
              Tab(child: Text('Day 1')),
              Tab(child: Text('Day 2')),
              Tab(child: Text('Day 3')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ScheduleListView(events: day1),
            ScheduleListView(events: day2),
            ScheduleListView(events: day3),
          ],
        ),
      ),
    );
  }
}

class ScheduleListView extends StatelessWidget {
  const ScheduleListView({required this.events, super.key});

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      padding: const EdgeInsets.all(12),
      itemCount: events.length,
      itemBuilder: (context, index) => EventCard(event: events[index]),
    );
  }
}
