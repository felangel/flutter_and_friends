import 'package:flutter_and_friends/schedule/schedule.dart';

final day1 = <Event>[
  Activity(
    name: 'Stockholm City Bike Tour',
    startTime: DateTime(2024, 9, 1, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/bike_tour.jpg',
    location: const Location(
      name: 'Djurgårdsboden',
      coordinates: (59.3242495, 18.099815),
    ),
  ),
  Activity(
    name: 'Stockholm Islands Kayak Tour',
    startTime: DateTime(2024, 9, 1, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/kayak_tour.jpg',
    location: const Location(
      name: 'Kayak centre in Rålis park',
      coordinates: (59.3254818, 18.0240966),
    ),
  ),
  Activity(
    name: 'Gröna Lund Theme Park Pentathlon',
    startTime: DateTime(2024, 9, 1, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/pentathlon.jpg',
    location: const Location(
      name: 'Gröna Lund',
      coordinates: (59.3232484, 18.0986932),
    ),
  ),
  Activity(
    name: 'HeySthlm Arcade & VREX',
    startTime: DateTime(2024, 9, 1, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/arcade.jpg',
    location: const Location(
      name: 'HeySthlm',
      coordinates: (59.3425689, 18.0497984),
    ),
  ),
  Activity(
    name: 'Bouldering at Klättercentret',
    startTime: DateTime(2024, 9, 1, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/bouldering.jpg',
    location: const Location(
      name: 'Nils Ericson statue',
      coordinates: (59.330482, 18.059049),
    ),
  ),
  Activity(
    name: 'Skansen Zoo + Aquarium + Historic village tour',
    startTime: DateTime(2024, 9, 1, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/zoo.jpg',
    location: const Location(
      name: 'Skansen tram stop',
      coordinates: (59.3240335, 18.0992596),
    ),
  ),
];

final day2 = <Event>[
  Activity(
    name: '✅ Check-in at Kulturhuset',
    startTime: DateTime(2024, 9, 2, 8, 45),
    duration: const Duration(minutes: 45),
    location: const Location(
      name: 'Kulturhuset',
      coordinates: (59.3318138, 18.0589957),
    ),
  ),
  ...talks.sublist(0, 5),
  Activity(
    name: '🍽️ Lunch',
    startTime: DateTime(2024, 9, 2, 11, 50),
    duration: const Duration(minutes: 70),
    location: const Location(
      name: 'Exhibition Area',
      coordinates: (59.3318138, 18.0589957),
    ),
    description: '''
Enjoy our buffet lunch. Remember there are lunch talks in the main atrium!''',
  ),
  ...talks.sublist(5, 11),
  Activity(
    name: '☕️ Fika',
    startTime: DateTime(2023, 9, 2, 15),
    duration: const Duration(minutes: 40),
    location: const Location(
      name: 'Main Stage',
      coordinates: (59.3318138, 18.0589957),
    ),
  ),
  ...talks.sublist(11),
  Activity(
    name: '🎙️ Panel discussion',
    startTime: DateTime(2023, 9, 2, 17, 20),
    duration: const Duration(minutes: 30),
    location: const Location(
      name: 'Main Stage',
      coordinates: (59.3318138, 18.0589957),
    ),
  ),
  Activity(
    name: '🎬 Closing Remarks',
    startTime: DateTime(2023, 9, 2, 17, 50),
    duration: const Duration(minutes: 10),
    location: const Location(
      name: 'Main Stage',
      coordinates: (59.3318138, 18.0589957),
    ),
  ),
];

final day3 = <Event>[...workshops];
