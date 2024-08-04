import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:puzzle_repository/puzzle_repository.dart';
import 'package:uuid/uuid.dart';

part 'puzzles_state.dart';
part 'puzzles_cubit.g.dart';

class PuzzlesCubit extends HydratedCubit<PuzzlesState> {
  PuzzlesCubit({required PuzzleRepository puzzleRepository})
      : _puzzleRepository = puzzleRepository,
        super(const PuzzlesState());

  final PuzzleRepository _puzzleRepository;

  Future<void> verifyUser({required String username}) async {
    try {
      emit(
        state.copyWith(
          userVerificationStatus: UserVerificationStatus.verifying,
        ),
      );

      final deviceId = state.deviceId ?? const Uuid().v4();
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
    } on UsernameAlreadyTaken catch (_) {
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
    } on EmptyData catch (_) {
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
  PuzzlesState? fromJson(Map<String, dynamic> json) =>
      PuzzlesState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(PuzzlesState state) => state.toJson();
}
