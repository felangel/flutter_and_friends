import 'package:arkroot_puzzle_api/arkroot_puzzle_api.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'puzzle.g.dart';

@JsonSerializable(explicitToJson: true)
class Puzzle extends Equatable {
  const Puzzle({
    required this.id,
    required this.index,
    required this.title,
    required this.assetUrl,
    required this.question,
    required this.type,
    required this.hint,
    required this.unlockTime,
    this.inputFillers,
    this.choices,
    this.matches,
    this.progress,
  });

  factory Puzzle.fromJson(Map<String, dynamic> json) => _$PuzzleFromJson(json);
  final int id;
  final int index;
  final String title;
  final String assetUrl;
  final String question;
  final PuzzleType type;
  final String hint;
  final String? inputFillers;
  final List<String>? choices;
  final Map<String, String>? matches;

  @JsonKey(fromJson: _fromUtcString, toJson: _toUtcString)
  final DateTime unlockTime;

  final UserProgress? progress;

  Map<String, dynamic> toJson() => _$PuzzleToJson(this);

  static DateTime _fromUtcString(String utcString) =>
      DateTime.parse(utcString).toLocal();

  static String _toUtcString(DateTime date) => date.toUtc().toIso8601String();

  @override
  List<Object?> get props => [
        id,
        index,
        title,
        assetUrl,
        question,
        type,
        hint,
        inputFillers,
        choices,
        matches,
        unlockTime,
        progress,
      ];
}

enum PuzzleType { input, singleChoice, matching }
