import 'package:flutter/material.dart';
import 'package:flutter_and_friends/schedule/schedule.dart';

class EventCard extends StatelessWidget {
  const EventCard({required this.event, super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
    if (event is Talk) return TalkCard(talk: event as Talk);
    if (event is Activity) return ActivityCard(activity: event as Activity);
    if (event is Workshop) return WorkshopCard(workshop: event as Workshop);
    return const SizedBox();
  }
}
