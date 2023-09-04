import 'package:flutter_and_friends/schedule/schedule.dart';

final day1 = <Event>[
  Activity(
    name: 'Stockholm City Bike Tour',
    startTime: DateTime(2023, 9, 3, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/bike_tour.jpg',
    location: const Location(
      name: 'Djurgårdsboden',
      coordinates: (59.3242495, 18.099815),
    ),
  ),
  Activity(
    name: 'Stockholm Islands Kayak Tour',
    startTime: DateTime(2023, 9, 3, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/kayak_tour.jpg',
    location: const Location(
      name: 'Kayak centre in Rålis park',
      coordinates: (59.3254818, 18.0240966),
    ),
  ),
  Activity(
    name: 'Gröna Lund Theme Park Pentathlon',
    startTime: DateTime(2023, 9, 3, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/pentathlon.jpg',
    location: const Location(
      name: 'Gröna Lund',
      coordinates: (59.3232484, 18.0986932),
    ),
  ),
  Activity(
    name: 'HeySthlm Arcade & VREX',
    startTime: DateTime(2023, 9, 3, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/arcade.jpg',
    location: const Location(
      name: 'HeySthlm',
      coordinates: (59.3425689, 18.0497984),
    ),
  ),
  Activity(
    name: 'Bouldering at Klättercentret',
    startTime: DateTime(2023, 9, 3, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/bouldering.jpg',
    location: const Location(
      name: 'Nils Ericson statue',
      coordinates: (59.330482, 18.059049),
    ),
  ),
  Activity(
    name: 'Skansen Zoo + Aquarium + Historic village tour',
    startTime: DateTime(2023, 9, 3, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/zoo.jpg',
    location: const Location(
      name: 'Skansen tram stop',
      coordinates: (59.3240335, 18.0992596),
    ),
  ),
  Activity(
    name: '🍽️ Dinner with Strangers',
    startTime: DateTime(2023, 9, 3, 18),
    duration: const Duration(hours: 2),
    description: '''
After an afternoon of activities it's time to grab some food! If you signed up for our Dinner With Strangers, a seasoned Stockholm local will take you to dinner with a few other attendees at one of our favorite affordable restaurants in the city.''',
    location: const Location(
      name: 'TBD',
      coordinates: (59.326038, 17.8172502),
    ),
  ),
  Activity(
    name: '🎯 Pre-conference Pub w/ Flutter Pub Quiz',
    startTime: DateTime(2023, 9, 3, 19),
    duration: const Duration(hours: 4),
    description: '''
It's the night before conference day and what better way to warm up than with a Flutter Pub Quiz?! Join and try to win prizes as quiz master Dominik tests your Flutter skills and crowns the first Flutter & Friends Quiz Champions!

Pub opens at 19 and quiz starts at 20:15''',
    location: const Location(
      name: 'International Bar',
      coordinates: (59.3355955, 18.0683371),
    ),
  ),
];

final day2 = <Event>[
  Activity(
    name: '✅ Check-in at Kulturhuset',
    startTime: DateTime(2023, 9, 4, 9),
    duration: const Duration(hours: 1),
    location: const Location(
      name: 'Kulturhuset',
      coordinates: (59.3318138, 18.0589957),
    ),
  ),
  Activity(
    name: '👋 Welcome to Flutter & Friends!',
    startTime: DateTime(2023, 9, 4, 10),
    duration: const Duration(minutes: 10),
    location: const Location(
      name: 'Main Stage',
      coordinates: (59.3318138, 18.0589957),
    ),
  ),
  ...talks.sublist(0, 2),
  Activity(
    name: '🍽️ Lunch',
    startTime: DateTime(2023, 9, 4, 11, 30),
    duration: const Duration(minutes: 90),
    location: const Location(
      name: 'Exhibition Area',
      coordinates: (59.3318138, 18.0589957),
    ),
    description: '''
Enjoy our buffet lunch. Remember there are lunch talks in the main atrium!''',
  ),
  ...talks.sublist(2),
  Activity(
    name: '🎙️ Panel discussion',
    startTime: DateTime(2023, 9, 4, 17, 20),
    duration: const Duration(minutes: 30),
    location: const Location(
      name: 'Main Stage',
      coordinates: (59.3318138, 18.0589957),
    ),
    description: '''
What is next for Flutter and its community? What problems are developers currently facing and how do we solve them? Join us as we finish the conference day with a panel of community members.''',
  ),
  Activity(
    name: '🎬 Closing Remarks',
    startTime: DateTime(2023, 9, 4, 17, 50),
    duration: const Duration(minutes: 10),
    location: const Location(
      name: 'Main Stage',
      coordinates: (59.3318138, 18.0589957),
    ),
  ),
  Activity(
    name: '🎉 Party',
    startTime: DateTime(2023, 9, 4, 19, 30),
    duration: const Duration(hours: 4),
    location: const Location(
      name: 'Slaktkyrkan',
      coordinates: (59.2926134,18.0802178),
    ),
    description: '''
You've been through a long conference day, now you deserve a party! Celebrate the Flutter community with DJ Albin, photo booth, games and beverages.''',
  ),
];

final day3 = <Event>[
  Activity(
    name: '✅ Check-in at either NoA or Devoteam',
    startTime: DateTime(2023, 9, 5, 9, 30),
    duration: const Duration(minutes: 30),
    location: const Location(
      name: 'NoA or Devoteam',
      coordinates: (59.3422061, 18.0620781),
    ),
  ),
  ...workshops,
];
