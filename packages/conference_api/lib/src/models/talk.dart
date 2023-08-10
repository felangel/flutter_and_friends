import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'talk.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.pascal)
class Talk extends Equatable {
  const Talk({
    required this.name,
    required this.avatar,
    required this.duration,
    required this.topic,
    required this.pitch,
    required this.twitter,
    required this.level,
    required this.topics,
    required this.slot,
  });

  factory Talk.fromJson(Map<String, dynamic> json) => _$TalkFromJson(json);

  final String name;
  final String avatar;
  final String duration;
  final String topic;
  final String pitch;
  final String twitter;
  final String level;
  final String topics;
  final String slot;

  @override
  List<Object> get props => [
        name,
        duration,
        topic,
        pitch,
        twitter,
        level,
        topics,
        slot,
      ];
}
