import 'package:conference_repository/conference_repository.dart';

/// {@template conference_repository}
/// A Dart repository which manages the conference domain
/// {@endtemplate}
class ConferenceRepository {
  /// {@macro conference_repository}
  const ConferenceRepository();

  List<Talk> getTalks() => talks;
}
