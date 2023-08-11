import 'package:conference_repository/conference_repository.dart';
import 'package:conference_repository/src/data/data.dart';

/// {@template conference_repository}
/// A Dart repository which manages the conference domain
/// {@endtemplate}
class ConferenceRepository {
  /// {@macro conference_repository}
  const ConferenceRepository();

  List<Talk> getTalks() => talks;
}
