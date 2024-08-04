// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puzzle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Puzzle _$PuzzleFromJson(Map<String, dynamic> json) => Puzzle(
      id: (json['id'] as num).toInt(),
      index: (json['index'] as num).toInt(),
      title: json['title'] as String,
      assetUrl: json['assetUrl'] as String,
      question: json['question'] as String,
      type: $enumDecode(_$PuzzleTypeEnumMap, json['type']),
      hint: json['hint'] as String,
      unlockTime: Puzzle._fromUtcString(json['unlockTime'] as String),
      inputFillers: json['inputFillers'] as String?,
      choices:
          (json['choices'] as List<dynamic>?)?.map((e) => e as String).toList(),
      matches: (json['matches'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      progress: json['progress'] == null
          ? null
          : UserProgress.fromJson(json['progress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PuzzleToJson(Puzzle instance) => <String, dynamic>{
      'id': instance.id,
      'index': instance.index,
      'title': instance.title,
      'assetUrl': instance.assetUrl,
      'question': instance.question,
      'type': _$PuzzleTypeEnumMap[instance.type]!,
      'hint': instance.hint,
      'inputFillers': instance.inputFillers,
      'choices': instance.choices,
      'matches': instance.matches,
      'unlockTime': Puzzle._toUtcString(instance.unlockTime),
      'progress': instance.progress?.toJson(),
    };

const _$PuzzleTypeEnumMap = {
  PuzzleType.input: 'input',
  PuzzleType.singleChoice: 'singleChoice',
  PuzzleType.matching: 'matching',
};
