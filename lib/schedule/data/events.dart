import 'package:flutter_and_friends/schedule/schedule.dart';
import 'package:flutter_and_friends/talks/talks.dart';

final events = <Event>[
  Activity(
    name: 'Stockholm City Bike Tour',
    startTime: DateTime(2023, 9, 3, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/bike_tour.jpg',
  ),
  Activity(
    name: 'Stockholm Islands Kayak Tour',
    startTime: DateTime(2023, 9, 3, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/kayak_tour.jpg',
  ),
  Activity(
    name: 'Gröna Lund Theme Park Pentathlon',
    startTime: DateTime(2023, 9, 3, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/pentathlon.jpg',
  ),
  Activity(
    name: 'HeySthlm Arcade & VREX',
    startTime: DateTime(2023, 9, 3, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/arcade.jpg',
  ),
  Activity(
    name: 'Bouldering at Klättercentret',
    startTime: DateTime(2023, 9, 3, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/bouldering.jpg',
  ),
  Activity(
    name: 'Skansen Zoo + Aquarium + Historic village tour',
    startTime: DateTime(2023, 9, 3, 13),
    duration: const Duration(hours: 3),
    image: 'assets/activities/zoo.jpg',
  ),
  Activity(
    name: 'Dinner with Strangers',
    startTime: DateTime(2023, 9, 3, 18),
    duration: const Duration(hours: 2),
    description: '''
After an afternoon of activities it's time to grab some food! If you signed up for our Dinner With Strangers, a seasoned Stockholm local will take you to dinner with a few other attendees at one of our favorite affordable restaurants in the city.''',
  ),
  Activity(
    name: 'Pre-conference Pub w/ Flutter Pub Quiz',
    startTime: DateTime(2023, 9, 3, 19),
    duration: const Duration(hours: 4),
    description: '''
It's the night before conference day and what better way to warm up than with a Flutter Pub Quiz?! Join and try to win prizes as quiz master Dominik tests your Flutter skills and crowns the first Flutter & Friends Quiz Champions!

Pub opens at 19 and quiz starts at 20:15''',
    location: 'International Bar, Norrlandsgatan 23',
  ),
  Activity(
    name: 'Check-in at Kulturhuset',
    startTime: DateTime(2023, 9, 4, 9),
    duration: const Duration(hours: 1),
    location: 'Kulturhuset',
  ),
  Activity(
    name: 'Welcome to Flutter & Friends!',
    startTime: DateTime(2023, 9, 4, 10),
    duration: const Duration(minutes: 10),
    location: 'Main Stage',
  ),
  ...talks.sublist(0, 3),
  Activity(
    name: 'Lunch',
    startTime: DateTime(2023, 9, 4, 11, 30),
    duration: const Duration(minutes: 90),
    location: 'Exhibition Area',
    description: '''
Enjoy our buffet lunch. Remember there are lunch talks in the main atrium!''',
  ),
  ...talks.sublist(3),
  Activity(
    name: 'Panel discussion',
    startTime: DateTime(2023, 9, 4, 17, 20),
    duration: const Duration(minutes: 30),
    location: 'Main Stage',
    description: '''
What is next for Flutter and its community? What problems are developers currently facing and how do we solve them? Join us as we finish the conference day with a panel of community members.''',
  ),
  Activity(
    name: 'Closing Remarks',
    startTime: DateTime(2023, 9, 4, 17, 50),
    duration: const Duration(minutes: 10),
    location: 'Main Stage',
  ),
  Activity(
    name: 'Party!',
    startTime: DateTime(2023, 9, 4, 20),
    duration: const Duration(hours: 4),
    location: 'Hus 7, Styckmästargatan 10',
    description: '''
You've been through a long conference day, now you deserve a party! Celebrate the Flutter community with DJ Albin, photo booth, games and beverages.''',
  ),
];
