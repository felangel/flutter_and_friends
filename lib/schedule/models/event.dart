import 'package:flutter_and_friends/schedule/schedule.dart';

interface class Event {
  const Event({
    required this.name,
    required this.duration,
    required this.startTime,
    this.location,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    switch (type) {
      case 'activity':
        return Activity.fromJson(json);
      case 'talk':
        return Talk.fromJson(json);
      case 'workshop':
        return Workshop.fromJson(json);
      default:
        throw UnsupportedError('Unsupported event type: "$type"');
    }
  }

  static Map<String, dynamic> toJson(Event event) {
    if (event is Activity) {
      return {
        'type': 'activity',
        ...event.toJson(),
      };
    }
    if (event is Talk) {
      return {
        'type': 'talk',
        ...event.toJson(),
      };
    }
    if (event is Workshop) {
      return {
        'type': 'workshop',
        ...event.toJson(),
      };
    }
    throw UnsupportedError('Unsupported event type: "$event"');
  }

  final String name;
  final Duration duration;
  final DateTime startTime;
  final String? location;
}
