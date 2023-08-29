import 'package:equatable/equatable.dart';
import 'package:flutter_and_friends/schedule/schedule.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity.g.dart';

@JsonSerializable()
class Activity extends Equatable implements Event {
  const Activity({
    required this.name,
    required this.duration,
    required this.startTime,
    required this.location,
    this.image,
    this.link,
    this.description,
  });

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityToJson(this);

  @override
  final String name;
  @override
  final Duration duration;
  @override
  final DateTime startTime;
  @override
  final Location location;

  final String? image;
  final String? link;
  final String? description;

  @override
  List<Object?> get props => [
        name,
        duration,
        startTime,
        location,
        image,
        link,
        description,
      ];
}
