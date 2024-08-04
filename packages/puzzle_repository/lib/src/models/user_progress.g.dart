// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProgress _$UserProgressFromJson(Map<String, dynamic> json) => UserProgress(
      userID: json['userID'] as String,
      score: (json['score'] as num).toInt(),
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$UserProgressToJson(UserProgress instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'answer': instance.answer,
      'score': instance.score,
    };
