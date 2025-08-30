import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organizer.g.dart';

@JsonSerializable()
class Organizer extends Equatable {
  const Organizer({
    required this.name,
    required this.avatar,
    this.twitter,
  });

  factory Organizer.fromJson(Map<String, dynamic> json) =>
      _$OrganizerFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizerToJson(this);

  final String name;
  final String avatar;
  final String? twitter;

  @override
  List<Object?> get props => [name, avatar, twitter];
}
