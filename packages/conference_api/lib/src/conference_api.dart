import 'dart:convert';
import 'dart:io';

import 'package:conference_api/conference_api.dart';
import 'package:http/http.dart' as http;

class HttpException implements Exception {
  const HttpException({
    required this.statusCode,
    required this.reason,
  });

  final int statusCode;
  final String reason;
}

/// {@template conference_api}
/// A Dart API client which exposes conference data
/// {@endtemplate}
class ConferenceApi {
  /// {@macro conference_api}
  ConferenceApi({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  Future<List<Talk>> getTalks() async {
    const url =
        'https://gist.githubusercontent.com/felangel/eea2b2d048d1510b439d1617c31399eb/raw/19b2f81121f119e1e63639acc119dc1886884406/data.json';
    final response = await _httpClient.get(Uri.parse(url));

    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(
        statusCode: response.statusCode,
        reason: response.body,
      );
    }

    final decoded = json.decode(response.body) as List;
    return decoded
        .map((e) => Talk.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
