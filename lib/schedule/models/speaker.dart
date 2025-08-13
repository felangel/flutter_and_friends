import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'speaker.g.dart';

@JsonSerializable()
class Speaker extends Equatable {
  const Speaker({
    required this.name,
    required this.title,
    required this.bio,
    required this.avatar,
    this.twitter,
  });

  factory Speaker.fromJson(Map<String, dynamic> json) =>
      _$SpeakerFromJson(json);

  Map<String, dynamic> toJson() => _$SpeakerToJson(this);

  final String name;
  final String title;
  final String bio;
  final String avatar;
  final String? twitter;

  @override
  List<Object?> get props => [name, title, bio, avatar, twitter];
}
