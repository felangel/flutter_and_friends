interface class Event {
  const Event({
    required this.name,
    required this.duration,
    required this.startTime,
    this.location,
  });

  final String name;
  final Duration duration;
  final DateTime startTime;
  final String? location;
}
