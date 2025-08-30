// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: strict_raw_type, require_trailing_commas, cast_nullable_to_non_nullable, lines_longer_than_80_chars

part of 'organizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organizer _$OrganizerFromJson(Map<String, dynamic> json) => Organizer(
  name: json['name'] as String,
  avatar: json['avatar'] as String,
  twitter: json['twitter'] as String?,
);

Map<String, dynamic> _$OrganizerToJson(Organizer instance) => <String, dynamic>{
  'name': instance.name,
  'avatar': instance.avatar,
  'twitter': instance.twitter,
};
