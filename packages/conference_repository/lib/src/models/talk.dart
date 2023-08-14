import 'package:conference_repository/conference_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'talk.g.dart';

@JsonSerializable()
class Talk extends Equatable {
  const Talk({
    required this.name,
    required this.speaker,
    required this.duration,
    required this.startTime,
    required this.location,
    required this.description,
  });

  factory Talk.fromJson(Map<String, dynamic> json) => _$TalkFromJson(json);

  Map<String, dynamic> toJson() => _$TalkToJson(this);

  final String name;
  final Speaker speaker;
  final Duration duration;
  final DateTime startTime;
  final String location;
  final String description;

  @override
  List<Object> get props => [
        name,
        speaker,
        duration,
        startTime,
        location,
        description,
      ];
}
