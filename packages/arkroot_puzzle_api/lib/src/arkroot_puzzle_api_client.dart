import 'dart:convert';

import 'package:arkroot_puzzle_api/arkroot_puzzle_api.dart';
import 'package:http/http.dart' as http;

/// Exception thrown when http request fails.
class RequestFailure implements Exception {}

/// Exception thrown when api response has no data.
class InvalidData implements Exception {}

/// Exception thrown when api response doesn't have a field or data.
class EmptyData implements Exception {}

class UsernameAlreadyTaken implements Exception {}

class ArkrootPuzzleApiClient {
  const ArkrootPuzzleApiClient({required String apiKey}) : _apiSecret = apiKey;

  static const String _baseUrl = 'newsic.ai';

  final String _apiSecret;

  Future<User> verifyUser({
    required String username,
    required String deviceId,
  }) async {
    final request = Uri.https(_baseUrl, 'api/verify.php');
    final body = {
      'username': username,
      'deviceId': deviceId,
      'apiSecret': _apiSecret,
    };

    final response = await http.post(request, body: body);

    if (response.statusCode != 200) throw RequestFailure();

    final responseDataJson = jsonDecode(response.body) as Map;

    if (!responseDataJson.containsKey('success')) throw InvalidData();

    final statusCode = responseDataJson['success'];
    if (statusCode == 300) throw UsernameAlreadyTaken();

    final userId = responseDataJson['userId'];
    final userJson = {
      'userID': userId,
      'username': username,
    };
    final user = User.fromJson(userJson);
    return user;
  }

  Future<List<Puzzle>> fetchPuzzles({required int userId}) async {
    final request = Uri.https(_baseUrl, 'api/fetchQuizzes.php');
    final body = {'userId': '$userId', 'apiSecret': _apiSecret};

    final response = await http.post(request, body: body);

    if (response.statusCode != 200) throw RequestFailure();

    final responseDataJson = jsonDecode(response.body) as Map;

    if (!responseDataJson.containsKey('data')) throw InvalidData();

    final puzzlesJsonList = responseDataJson['data'] as List;
    return puzzlesJsonList
        .map((json) => Puzzle.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<UserProgress> submitAnswer({
    required int userId,
    required int puzzleId,
    required dynamic answer,
  }) async {
    final request = Uri.https(_baseUrl, 'api/submitAnswer.php');
    final body = {
      'userId': userId.toString(),
      'questionId': puzzleId.toString(),
      'answer': answer,
      'apiSecret': _apiSecret,
    };

    final response = await http.post(request, body: body);

    if (response.statusCode != 200) throw RequestFailure();

    final responseDataJson = jsonDecode(response.body) as Map;

    if (!responseDataJson.containsKey('success')) throw InvalidData();
    if (!responseDataJson.containsKey('progress')) throw EmptyData();

    final userProgressJson =
        responseDataJson['progress'] as Map<String, dynamic>;

    return UserProgress.fromJson(userProgressJson);
  }

  Future<List<User>> fetchLeaderboard({required int page}) async {
    final request = Uri.https(_baseUrl, 'api/fetchLeaderboard.php');
    final body = {'page': '$page', 'apiSecret': _apiSecret};

    final response = await http.post(request, body: body);

    if (response.statusCode != 200) throw RequestFailure();

    final responseDataJson = jsonDecode(response.body) as Map;

    if (!responseDataJson.containsKey('data')) throw InvalidData();

    final leaderboardJsonList = responseDataJson['data'] as List;
    return leaderboardJsonList
        .map((json) => User.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
