import 'package:conference_repository/conference_repository.dart';

class Talk {
  const Talk({
    required this.name,
    required this.speaker,
    required this.duration,
    required this.startTime,
    required this.location,
    required this.description,
  });

  final String name;
  final Speaker speaker;
  final Duration duration;
  final DateTime startTime;
  final String location;
  final String description;
}
