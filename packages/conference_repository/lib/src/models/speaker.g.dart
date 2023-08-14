// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speaker _$SpeakerFromJson(Map<String, dynamic> json) => Speaker(
      name: json['name'] as String,
      title: json['title'] as String,
      avatar: json['avatar'] as String,
      twitter: json['twitter'] as String?,
    );

Map<String, dynamic> _$SpeakerToJson(Speaker instance) => <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'avatar': instance.avatar,
      'twitter': instance.twitter,
    };
