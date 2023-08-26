import 'package:flutter/material.dart';
import 'package:flutter_and_friends/schedule/schedule.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) => ScheduleView(events: events);
}

class ScheduleView extends StatelessWidget {
  const ScheduleView({required this.events, super.key});

  final List<Event> events;

  @override
  Widget build(BuildContext context) => ScheduleListView(events: events);
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
