import 'package:flutter_and_friends/schedule/schedule.dart';

final allEvents = <Event>[...day1, ...day2, ...day3];

final day1 = <Event>[
  Activity(
    name: 'Bike Tour',
    startTime: DateTime(2025, 8, 31, 13),
    duration: const Duration(hours: 2),
    description: '''
You will get to bike around the beautiful city of Stockholm.

There will be two routes to pick from depending on how far you want to bike.''',
    image: 'assets/activities/bike_tour.jpg',
    location: const Location(
      name: 'Djurgårdsboden',
      coordinates: (59.3242495, 18.099815),
    ),
  ),
  Activity(
    name: 'Gröna Lund Theme Park',
    startTime: DateTime(2025, 8, 31, 13),
    duration: const Duration(hours: 2),
    description: '''
Gröna Lund is a classic amusement park filled with thrilling rides, live music, and a vibrant atmosphere right in the heart of Stockholm.

You'll even get to do the classic pentathlon!''',
    image: 'assets/activities/pentathlon.jpg',
    location: const Location(
      name: 'Gröna Lund',
      coordinates: (59.3233564, 18.0963901),
    ),
  ),
  Activity(
    name: 'Skansen Zoo & History Village Tour',
    startTime: DateTime(2025, 8, 31, 13),
    duration: const Duration(hours: 2),
    description: '''
At Skansen you will get to see Swedish history, culture and wildlife in one captivating setting.''',
    image: 'assets/activities/zoo.jpg',
    location: const Location(
      name: 'Skansenbutiken',
      coordinates: (59.3244718, 18.100444),
    ),
  ),
  Activity(
    name: 'Escape Room',
    startTime: DateTime(2025, 8, 31, 13),
    duration: const Duration(hours: 2),
    description: '''
Get locked in a room together with a small group of people and try to get out in time.

It is both thrilling and requires you to think on your feet!''',
    image: 'assets/activities/escape_room.jpg',
    location: const Location(
      name: 'Escape Stories',
      coordinates: (59.3345765, 18.055558),
    ),
  ),
  Activity(
    name: 'Disc Golf',
    startTime: DateTime(2025, 8, 31, 13),
    duration: const Duration(hours: 2),
    description: '''
Disc golf with the world famous meme-creator Mangirdas and a perfect opportunity to connect with nature. Throw frisbees towards targets and enjoy the beautiful outdoors.''',
    image: 'assets/activities/disc_golf.jpg',
    location: const Location(
      name: 'Kaknäs DiscGolfPark',
      coordinates: (59.3341683, 18.1282904),
    ),
  ),
  Activity(
    name: 'Islands Kayak Tour',
    startTime: DateTime(2025, 8, 31, 13),
    duration: const Duration(hours: 2),
    description: '''
You'll get to kayak between the islands and under the bridges, experiencing Stockholm in a way you've never seen it before.''',
    image: 'assets/activities/kayak_tour.jpg',
    location: const Location(
      name: 'Eden Kajak',
      coordinates: (59.3255365, 18.0201859),
    ),
  ),
  Activity(
    name: 'Bouldering',
    startTime: DateTime(2025, 8, 31, 13),
    duration: const Duration(hours: 2),
    description: '''
You'll get to experience the thrill of climbing/bouldering at Klättercentret Telefonplan.''',
    image: 'assets/activities/bouldering.jpg',
    location: const Location(
      name: 'Klättercentret Telefonplan',
      coordinates: (59.2990912, 17.9915368),
    ),
  ),
  Activity(
    name: 'VR Games & Arcade',
    startTime: DateTime(2025, 8, 31, 14, 30),
    duration: const Duration(hours: 2),
    description: '''
You'll get to play arcade and VR games in the heart of Stockholm.''',
    image: 'assets/activities/arcade.jpg',
    location: const Location(
      name: 'VREX City',
      coordinates: (59.33216, 18.0653693),
    ),
  ),
  Activity(
    name: '🍽️ Dinner with Strangers',
    startTime: DateTime(2025, 8, 31, 18),
    duration: const Duration(hours: 2),
    description: '''
Step out of your comfort zone and into a world of new connections. Dinner with Strangers splits you into groups for an unforgettable meal filled with conversation, laughter, and the chance to forge unexpected friendships. Are you ready to meet your new favorite people?''',
    location: const Location(name: 'TBD', coordinates: (59.326038, 17.8172502)),
  ),
  Activity(
    name: "🍽️ Speakers' Dinner",
    startTime: DateTime(2025, 8, 31, 18, 30),
    duration: const Duration(hours: 2, minutes: 30),
    description: '''
This is a dinner hosted at the Google office for speakers and sponsors that have signed up for it.''',
    location: const Location(
      name: 'Google Office',
      coordinates: (59.3334327, 18.0545033),
    ),
  ),
  Activity(
    name: '🎯 Flutter & Fun Pub Quiz',
    startTime: DateTime(2025, 8, 31, 20),
    duration: const Duration(hours: 3),
    description: '''
Join fellow Flutter enthusiasts for a night of great conversation, a challenging pub quiz, and beers. It's the perfect opportunity to network, relax, and have some fun!''',
    location: const Location(
      name: 'International Bar',
      coordinates: (59.3355955, 18.070912),
    ),
  ),
];

final day2 = <Event>[
  Activity(
    name: '✍️ Registration',
    startTime: DateTime(2025, 9, 1, 9),
    duration: const Duration(minutes: 30),
    description: '''
Try to be there early, since the check-in is pretty short.

If you come early you will also get some extra swag 😉''',
    location: mainStage,
  ),
  ...talks.sublist(0, 5),
  Activity(
    name: '''🎤 Slides Karaoke 2.0: Generating presentations on the fly''',
    startTime: DateTime(2025, 9, 1, 12, 5),
    duration: const Duration(minutes: 20),
    description:
        '''Test your improvisation skills in PowerPoint Karaoke, where participants give impromptu presentations using random, unseen slides. Whether you're presenting or in the audience, expect lots of laughs and surprises in this lively, unpredictable session!''',
    location: mainStage,
  ),
  ...talks.sublist(5, 16),
  Activity(
    name: '🎙️ Panel discussion',
    startTime: DateTime(2025, 9, 1, 17, 30),
    duration: const Duration(minutes: 30),
    location: mainStage,
  ),
  Activity(
    name: '🎬 Closing Words',
    startTime: DateTime(2025, 9, 1, 17, 55),
    duration: const Duration(minutes: 10),
    location: mainStage,
  ),
  Activity(
    name: '🪩 Flutter & Friends Party',
    startTime: DateTime(2025, 9, 1, 19, 30),
    duration: const Duration(minutes: 330),
    description: '''
Unleash the Night! 🕺
Get ready for an unforgettable evening with dazzling disco lights, refreshing drinks, awesome music, and the thrilling excitement of the competition Flutter in the Dark! 🌙 It's the perfect recipe for a night you won't forget. Don't miss out!''',
    location: const Location(
      name: 'Slaktkyrkan',
      coordinates: (59.2924963, 18.0800201),
    ),
  ),
];

final day3 = <Event>[...workshops];
