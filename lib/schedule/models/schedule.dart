import 'package:equatable/equatable.dart';
import 'package:flutter_and_friends/schedule/schedule.dart';

class Schedule extends Equatable {
  const Schedule({required this.events});

  final List<Event> events;

  @override
  List<Object> get props => [events];
}
