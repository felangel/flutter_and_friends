import 'package:arkroot_puzzle_api/arkroot_puzzle_api.dart' as client;
import 'package:puzzle_repository/puzzle_repository.dart';

import 'models/models.dart';

class PuzzleRepository {
  PuzzleRepository({required client.ArkrootPuzzleApiClient puzzleApiClient})
      : _puzzleApiClient = puzzleApiClient;

  final client.ArkrootPuzzleApiClient _puzzleApiClient;

  Future<User> verifyUser({
    required String username,
    required String deviceId,
  }) async {
    final user = await _puzzleApiClient.verifyUser(
      username: username,
      deviceId: deviceId,
    );
    return User.fromJson(user.toJson());
  }

  Future<List<Puzzle>> fetchPuzzles({required int userId}) async {
    final puzzles = await _puzzleApiClient.fetchPuzzles(userId: userId);
    return puzzles.map((p) => Puzzle.fromJson(p.toJson())).toList();
  }

  Future<UserProgress> submitAnswer({
    required int userId,
    required int puzzleId,
    required dynamic answer,
  }) async {
    final userProgress = await _puzzleApiClient.submitAnswer(
      userId: userId,
      puzzleId: puzzleId,
      answer: answer,
    );
    return UserProgress.fromJson(userProgress.toJson());
  }

  Future<List<User>> fetchLeaderboard({required int page}) async {
    final leaderboard = await _puzzleApiClient.fetchLeaderboard(page: page);
    return leaderboard.map((u) => User.fromJson(u.toJson())).toList();
  }
}
