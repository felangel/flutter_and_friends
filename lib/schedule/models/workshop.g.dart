// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workshop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workshop _$WorkshopFromJson(Map<String, dynamic> json) => Workshop(
      name: json['name'] as String,
      speaker: Speaker.fromJson(json['speaker'] as Map<String, dynamic>),
      duration: Duration(microseconds: json['duration'] as int),
      startTime: DateTime.parse(json['startTime'] as String),
      description: json['description'] as String,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$WorkshopToJson(Workshop instance) => <String, dynamic>{
      'name': instance.name,
      'duration': instance.duration.inMicroseconds,
      'startTime': instance.startTime.toIso8601String(),
      'location': instance.location,
      'speaker': instance.speaker,
      'description': instance.description,
    };
