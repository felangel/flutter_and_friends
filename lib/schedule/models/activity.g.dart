// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      name: json['name'] as String,
      duration: Duration(microseconds: json['duration'] as int),
      startTime: DateTime.parse(json['startTime'] as String),
      image: json['image'] as String?,
      link: json['link'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'name': instance.name,
      'duration': instance.duration.inMicroseconds,
      'startTime': instance.startTime.toIso8601String(),
      'location': instance.location,
      'image': instance.image,
      'link': instance.link,
      'description': instance.description,
    };
