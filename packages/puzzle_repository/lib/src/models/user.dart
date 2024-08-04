import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends Equatable {
  final int userID;
  final String username;
  @JsonKey(defaultValue: 0)
  final int totalScore;

  const User({
    required this.userID,
    required this.username,
    this.totalScore = 0,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [userID, username, totalScore];
}
