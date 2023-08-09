import 'package:conference_api/conference_api.dart';

class GetTalksException implements Exception {
  const GetTalksException({required this.message, required this.details});

  final String message;
  final String details;
}

/// {@template conference_repository}
/// A Dart repository which manages the conference domain
/// {@endtemplate}
class ConferenceRepository {
  /// {@macro conference_repository}
  ConferenceRepository({ConferenceApi? conferenceApi})
      : _conferenceApi = conferenceApi ?? ConferenceApi();

  final ConferenceApi _conferenceApi;

  Future<List<Talk>> getTalks() async {
    try {
      return await _conferenceApi.getTalks();
    } on HttpException catch (error) {
      throw GetTalksException(
        message: 'Unable to fetch talks.',
        details: '${error.reason} (${error.statusCode})',
      );
    } catch (error) {
      throw GetTalksException(
        message: 'Unable to fetch talks.',
        details: '$error',
      );
    }
  }
}
