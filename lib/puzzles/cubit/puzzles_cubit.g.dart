// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: strict_raw_type, require_trailing_commas, cast_nullable_to_non_nullable, lines_longer_than_80_chars

part of 'puzzles_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PuzzlesState _$PuzzlesStateFromJson(Map<String, dynamic> json) => PuzzlesState(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      userVerificationStatus: $enumDecodeNullable(
              _$UserVerificationStatusEnumMap,
              json['userVerificationStatus']) ??
          UserVerificationStatus.unverified,
      puzzles: (json['puzzles'] as List<dynamic>?)
          ?.map((e) => Puzzle.fromJson(e as Map<String, dynamic>))
          .toList(),
      puzzlesFetchingStatus: $enumDecodeNullable(
              _$FetchStatusEnumMap, json['puzzlesFetchingStatus']) ??
          FetchStatus.notFetched,
      currentPuzzleSubmissionStatus: $enumDecodeNullable(
              _$SubmissionStatusEnumMap,
              json['currentPuzzleSubmissionStatus']) ??
          SubmissionStatus.notSubmitted,
      leaderboard: (json['leaderboard'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextLeaderboardPage: (json['nextLeaderboardPage'] as num?)?.toInt() ?? 1,
      leaderboardFetchingStatus: $enumDecodeNullable(
              _$FetchStatusEnumMap, json['leaderboardFetchingStatus']) ??
          FetchStatus.notFetched,
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$PuzzlesStateToJson(PuzzlesState instance) =>
    <String, dynamic>{
      'user': instance.user,
      'deviceId': instance.deviceId,
      'userVerificationStatus':
          _$UserVerificationStatusEnumMap[instance.userVerificationStatus],
      'puzzles': instance.puzzles,
      'puzzlesFetchingStatus':
          _$FetchStatusEnumMap[instance.puzzlesFetchingStatus],
      'currentPuzzleSubmissionStatus':
          _$SubmissionStatusEnumMap[instance.currentPuzzleSubmissionStatus],
      'leaderboard': instance.leaderboard,
      'nextLeaderboardPage': instance.nextLeaderboardPage,
      'leaderboardFetchingStatus':
          _$FetchStatusEnumMap[instance.leaderboardFetchingStatus],
    };

const _$UserVerificationStatusEnumMap = {
  UserVerificationStatus.unverified: 'unverified',
  UserVerificationStatus.verifying: 'verifying',
  UserVerificationStatus.verified: 'verified',
  UserVerificationStatus.existingUsername: 'existingUsername',
  UserVerificationStatus.failed: 'failed',
};

const _$FetchStatusEnumMap = {
  FetchStatus.notFetched: 'notFetched',
  FetchStatus.fetching: 'fetching',
  FetchStatus.fetched: 'fetched',
  FetchStatus.failed: 'failed',
};

const _$SubmissionStatusEnumMap = {
  SubmissionStatus.notSubmitted: 'notSubmitted',
  SubmissionStatus.submitting: 'submitting',
  SubmissionStatus.submitted: 'submitted',
  SubmissionStatus.failed: 'failed',
};
