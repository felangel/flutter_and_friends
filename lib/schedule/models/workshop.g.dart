// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: strict_raw_type, require_trailing_commas, cast_nullable_to_non_nullable, lines_longer_than_80_chars

part of 'workshop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workshop _$WorkshopFromJson(Map<String, dynamic> json) => Workshop(
      name: json['name'] as String,
      speaker: Speaker.fromJson(json['speaker'] as Map<String, dynamic>),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      startTime: DateTime.parse(json['startTime'] as String),
      description: json['description'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkshopToJson(Workshop instance) => <String, dynamic>{
      'name': instance.name,
      'duration': instance.duration.inMicroseconds,
      'startTime': instance.startTime.toIso8601String(),
      'location': instance.location,
      'speaker': instance.speaker,
      'description': instance.description,
    };
