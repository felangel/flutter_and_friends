import 'package:equatable/equatable.dart';
import 'package:flutter_and_friends/schedule/schedule.dart';
import 'package:json_annotation/json_annotation.dart';

part 'talk.g.dart';

@JsonSerializable()
class Talk extends Equatable implements Event {
  const Talk({
    required this.name,
    required this.speakers,
    required this.duration,
    required this.startTime,
    required this.location,
    required this.description,
  });

  factory Talk.fromJson(Map<String, dynamic> json) => _$TalkFromJson(json);

  Map<String, dynamic> toJson() => _$TalkToJson(this);

  @override
  final String name;

  @override
  final Duration duration;

  @override
  final DateTime startTime;

  @override
  final Location location;

  final List<Speaker> speakers;

  final String description;

  @override
  List<Object> get props => [
        name,
        speakers,
        duration,
        startTime,
        location,
        description,
      ];
}
