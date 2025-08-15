// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: strict_raw_type, require_trailing_commas, cast_nullable_to_non_nullable, lines_longer_than_80_chars

part of 'speaker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speaker _$SpeakerFromJson(Map<String, dynamic> json) => Speaker(
  name: json['name'] as String,
  title: json['title'] as String,
  bio: json['bio'] as String,
  avatar: json['avatar'] as String,
  twitter: json['twitter'] as String?,
);

Map<String, dynamic> _$SpeakerToJson(Speaker instance) => <String, dynamic>{
  'name': instance.name,
  'title': instance.title,
  'bio': instance.bio,
  'avatar': instance.avatar,
  'twitter': instance.twitter,
};
