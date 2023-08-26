// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Talk _$TalkFromJson(Map<String, dynamic> json) => Talk(
      name: json['name'] as String,
      speaker: Speaker.fromJson(json['speaker'] as Map<String, dynamic>),
      duration: Duration(microseconds: json['duration'] as int),
      startTime: DateTime.parse(json['startTime'] as String),
      location: json['location'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$TalkToJson(Talk instance) => <String, dynamic>{
      'name': instance.name,
      'duration': instance.duration.inMicroseconds,
      'startTime': instance.startTime.toIso8601String(),
      'location': instance.location,
      'speaker': instance.speaker,
      'description': instance.description,
    };
