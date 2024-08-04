import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_progress.g.dart';

@JsonSerializable(explicitToJson: true)
class UserProgress extends Equatable {
  const UserProgress({
    required this.userID,
    required this.score,
    this.answer,
  });

  factory UserProgress.fromJson(Map<String, dynamic> json) =>
      _$UserProgressFromJson(json);

  final String userID;
  final String? answer;
  final int score;

  Map<String, dynamic> toJson() => _$UserProgressToJson(this);

  @override
  List<Object?> get props => [userID, answer, score];
}
