part of 'puzzles_cubit.dart';

enum UserVerificationStatus {
  unverified,
  verifying,
  verified,
  existingUsername,
  failed,
}

enum FetchStatus {
  notFetched,
  fetching,
  fetched,
  failed,
}

enum SubmissionStatus {
  notSubmitted,
  submitting,
  submitted,
  failed,
}

@JsonSerializable()
class PuzzlesState extends Equatable {
  const PuzzlesState({
    this.user,
    this.userVerificationStatus = UserVerificationStatus.unverified,
    this.puzzles,
    this.puzzlesFetchingStatus = FetchStatus.notFetched,
    this.currentPuzzleSubmissionStatus = SubmissionStatus.notSubmitted,
    this.leaderboard,
    this.nextLeaderboardPage = 1,
    this.leaderboardFetchingStatus = FetchStatus.notFetched,
    this.deviceId,
  });

  factory PuzzlesState.fromJson(Map<String, dynamic> json) =>
      _$PuzzlesStateFromJson(json);

  final User? user;
  final String? deviceId;
  final UserVerificationStatus userVerificationStatus;
  final List<Puzzle>? puzzles;
  final FetchStatus puzzlesFetchingStatus;
  final SubmissionStatus currentPuzzleSubmissionStatus;
  final List<User>? leaderboard;
  final int nextLeaderboardPage;
  final FetchStatus leaderboardFetchingStatus;

  PuzzlesState copyWith({
    User? user,
    UserVerificationStatus? userVerificationStatus,
    List<Puzzle>? puzzles,
    FetchStatus? puzzlesFetchingStatus,
    SubmissionStatus? currentPuzzleSubmissionStatus,
    List<User>? leaderboard,
    int? nextLeaderboardPage,
    FetchStatus? leaderboardFetchingStatus,
    String? deviceId,
  }) {
    return PuzzlesState(
      user: user ?? this.user,
      userVerificationStatus:
          userVerificationStatus ?? this.userVerificationStatus,
      puzzles: puzzles ?? this.puzzles,
      puzzlesFetchingStatus:
          puzzlesFetchingStatus ?? this.puzzlesFetchingStatus,
      currentPuzzleSubmissionStatus:
          currentPuzzleSubmissionStatus ?? this.currentPuzzleSubmissionStatus,
      leaderboard: leaderboard ?? this.leaderboard,
      nextLeaderboardPage: nextLeaderboardPage ?? this.nextLeaderboardPage,
      leaderboardFetchingStatus:
          leaderboardFetchingStatus ?? this.leaderboardFetchingStatus,
      deviceId: deviceId ?? this.deviceId,
    );
  }

  @override
  List<Object?> get props => [
        deviceId,
        user,
        userVerificationStatus,
        puzzles,
        puzzlesFetchingStatus,
        currentPuzzleSubmissionStatus,
        leaderboard,
        leaderboardFetchingStatus,
      ];

  bool get hasUser => user != null;

  bool get initialLeaderboardFetched =>
      nextLeaderboardPage > 1 && leaderboard != null;

  bool get hasMoreLeaderboardData {
    if (!initialLeaderboardFetched) return false;
    const pageCount = 10;
    final currentLeaderboardPage = nextLeaderboardPage - 1;
    final currentMaxCount = currentLeaderboardPage * pageCount;
    return currentMaxCount - leaderboard!.length == 0;
  }

  bool get fetchingLeaderboard =>
      leaderboardFetchingStatus == FetchStatus.fetching;

  Map<String, dynamic> toJson() => _$PuzzlesStateToJson(this);
}
