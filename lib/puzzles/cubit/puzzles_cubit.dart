import 'package:arkroot_puzzle_api/arkroot_puzzle_api.dart' as client;
import 'package:custom_platform_device_id/platform_device_id.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:puzzle_repository/puzzle_repository.dart';

part 'puzzles_state.dart';

class PuzzlesCubit extends HydratedCubit<PuzzlesState> {
  PuzzlesCubit({PuzzleRepository? puzzleRepository})
      : _puzzleRepository = puzzleRepository ??
            PuzzleRepository(
              puzzleApiClient: client.ArkrootPuzzleApiClient(
                apiKey: '102934e85a7cec4769d8c08207f025e0f1e252bd',
              ),
            ),
        super(const PuzzlesState());

  final PuzzleRepository _puzzleRepository;

  Future<void> verifyUser({required String username}) async {
    try {
      emit(
        state.copyWith(
          userVerificationStatus: UserVerificationStatus.verifying,
        ),
      );
      final deviceId = await PlatformDeviceId.getDeviceId;
      if (deviceId == null) {
        emit(
          state.copyWith(userVerificationStatus: UserVerificationStatus.failed),
        );
        return;
      }
      final user = await _puzzleRepository.verifyUser(
        username: username,
        deviceId: deviceId,
      );
      emit(
        state.copyWith(
          user: user,
          userVerificationStatus: UserVerificationStatus.verified,
        ),
      );
    } on client.UsernameAlreadyTaken catch (_) {
      emit(
        state.copyWith(
          userVerificationStatus: UserVerificationStatus.existingUsername,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          userVerificationStatus: UserVerificationStatus.failed,
        ),
      );
    }
  }

  Future<void> fetchPuzzles() async {
    try {
      emit(
        state.copyWith(puzzlesFetchingStatus: FetchStatus.fetching),
      );
      final puzzles = await _puzzleRepository.fetchPuzzles(
        userId: state.user!.userID,
      );
      emit(
        state.copyWith(
          puzzles: puzzles,
          puzzlesFetchingStatus: FetchStatus.fetched,
        ),
      );
    } catch (_) {
      emit(state.copyWith(puzzlesFetchingStatus: FetchStatus.failed));
    }
  }

  Future<void> submitAnswer({
    required int puzzleId,
    required dynamic answer,
  }) async {
    try {
      emit(
        state.copyWith(
          currentPuzzleSubmissionStatus: SubmissionStatus.submitting,
        ),
      );
      final userProgress = await _puzzleRepository.submitAnswer(
        userId: state.user!.userID,
        puzzleId: puzzleId,
        answer: answer,
      );
      _updatePuzzleProgress(
        puzzleId: puzzleId,
        userProgress: userProgress,
      );
    } on client.EmptyData catch (_) {
      final userProgress = UserProgress(
        score: 0,
        userID: state.user!.userID.toString(),
      );
      _updatePuzzleProgress(
        puzzleId: puzzleId,
        userProgress: userProgress,
      );
    } catch (_) {
      emit(
        state.copyWith(currentPuzzleSubmissionStatus: SubmissionStatus.failed),
      );
    }
  }

  void _updatePuzzleProgress({
    required int puzzleId,
    UserProgress? userProgress,
  }) {
    final puzzles = state.puzzles!.toList();
    final currentPuzzleIndex = puzzles.indexWhere((p) => p.id == puzzleId);
    puzzles[currentPuzzleIndex] =
        puzzles[currentPuzzleIndex].copyUserProgress(userProgress);
    emit(
      state.copyWith(
        currentPuzzleSubmissionStatus: SubmissionStatus.submitted,
        puzzles: puzzles,
      ),
    );
  }

  Future<void> fetchLeaderboard({bool isNew = false}) async {
    try {
      emit(
        state.copyWith(
          leaderboardFetchingStatus: FetchStatus.fetching,
          nextLeaderboardPage: isNew ? 1 : null,
        ),
      );
      final leaderboard = await _puzzleRepository.fetchLeaderboard(
        page: state.nextLeaderboardPage,
      );
      emit(
        state.copyWith(
          leaderboard: isNew ? leaderboard : state.leaderboard! + leaderboard,
          leaderboardFetchingStatus: FetchStatus.fetched,
          nextLeaderboardPage: state.nextLeaderboardPage + 1,
        ),
      );
    } catch (_) {
      emit(state.copyWith(leaderboardFetchingStatus: FetchStatus.failed));
    }
  }

  @override
  PuzzlesState? fromJson(Map<String, dynamic> json) {
    final user = json['user'] != null
        ? User.fromJson(json['user'] as Map<String, dynamic>)
        : null;
    final userVerificationStatus = UserVerificationStatus.values
        .firstWhere((s) => s.name == json['userVerificationStatus']);
    final puzzles = (json['puzzles'] as List?)
        ?.map((p) => Puzzle.fromJson(p as Map<String, dynamic>))
        .toList();
    final leaderboard = (json['leaderboard'] as List?)
        ?.map((p) => User.fromJson(p as Map<String, dynamic>))
        .toList();
    final nextLeaderboardPage = json['nextLeaderboardPage'] as int;

    return PuzzlesState(
      user: user,
      userVerificationStatus: userVerificationStatus,
      puzzles: puzzles,
      leaderboard: leaderboard,
      nextLeaderboardPage: nextLeaderboardPage,
    );
  }

  @override
  Map<String, dynamic>? toJson(PuzzlesState state) {
    final json = {
      'user': state.user?.toJson(),
      'userVerificationStatus': state.userVerificationStatus.name,
      'puzzles': state.puzzles?.map((p) => p.toJson()).toList(),
      'puzzlesFetchingStatus': state.puzzlesFetchingStatus.name,
      'currentPuzzleSubmissionStatus': state.currentPuzzleSubmissionStatus.name,
      'leaderboard': state.leaderboard?.map((u) => u.toJson()).toList(),
      'nextLeaderboardPage': state.nextLeaderboardPage,
      'leaderboardFetchingStatus': state.leaderboardFetchingStatus.name,
    };
    return json;
  }
}
