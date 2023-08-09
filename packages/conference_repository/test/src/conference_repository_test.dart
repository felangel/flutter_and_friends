// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:conference_repository/conference_repository.dart';

void main() {
  group('ConferenceRepository', () {
    test('can be instantiated', () {
      expect(ConferenceRepository(), isNotNull);
    });
  });
}
