import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ntp/ntp.dart';
import 'package:puzzle_repository/puzzle_repository.dart';

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

  Puzzle copyUserProgress(UserProgress? newProgress) {
    return Puzzle(
      id: id,
      index: index,
      title: title,
      assetUrl: assetUrl,
      question: question,
      type: type,
      hint: hint,
      unlockTime: unlockTime,
      inputFillers: inputFillers,
      choices: choices,
      matches: matches,
      progress: newProgress,
    );
  }

  Future<PuzzleStatus> get puzzleStatus async {
    if (progress != null && progress!.score > 0) return PuzzleStatus.completed;
    final now = await NTP.now();
    if (now.isBefore(unlockTime)) return PuzzleStatus.locked;
    return PuzzleStatus.unlocked;
  }
}

enum PuzzleType {
  input,
  singleChoice,
  matching,
}

enum PuzzleStatus {
  locked,
  unlocked,
  completed,
}
