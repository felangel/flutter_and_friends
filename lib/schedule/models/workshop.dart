import 'package:equatable/equatable.dart';
import 'package:flutter_and_friends/schedule/schedule.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workshop.g.dart';

@JsonSerializable()
class Workshop extends Equatable implements Event {
  const Workshop({
    required this.name,
    required this.speaker,
    required this.duration,
    required this.startTime,
    required this.description,
    this.location,
  });

  factory Workshop.fromJson(Map<String, dynamic> json) =>
      _$WorkshopFromJson(json);

  Map<String, dynamic> toJson() => _$WorkshopToJson(this);

  @override
  final String name;

  @override
  final Duration duration;

  @override
  final DateTime startTime;

  @override
  final String? location;

  final Speaker speaker;

  final String description;

  @override
  List<Object?> get props => [
        name,
        speaker,
        duration,
        startTime,
        location,
        description,
      ];
}
