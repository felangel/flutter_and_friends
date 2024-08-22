import 'package:flutter_and_friends/schedule/schedule.dart';

const devoteam = Location(
  name: 'Devoteam',
  coordinates: (59.3308268, 18.0633923),
);
Location noA({required int floor}) => Location(
      name: 'NoA (Floor $floor)',
      coordinates: (59.3422061, 18.0620781),
    );

final workshops = <Workshop>[
  Workshop(
    name: 'Join the Flock: Add Shorebird to your Flutter apps',
    speaker: craigLabenz,
    duration: const Duration(minutes: 90),
    startTime: DateTime(2023, 9, 5, 10),
    location: devoteam,
    description: '''
In this workshop we’ll walk through all the steps needed to get Shorebird working on a Flutter app of your choice. Either follow along with a provided Flutter app or bring your own app. Along the way we’ll look at how to manage apps, releases, patches, and more using the Shorebird CLI and Console. We will also cover how to use package:shorebird_code_push to customize the user experience.

By the end of the workshop, you should have Shorebird’s code push solution integrated into a Flutter app and have a solid understanding of how to deliver over the air updates to your users.''',
  ),
  Workshop(
    name: 'Flutter Animations: From Beginner to Advanced',
    speaker: roaaKhaddam,
    duration: const Duration(minutes: 90),
    startTime: DateTime(2023, 9, 5, 10),
    location: noA(floor: 4),
    description: '''
User interfaces without animations are like food without salt, just tasteless. In this workshop, you will learn how to add animations with various complexity to your Flutter UIs. We will start by covering the most basic and subtle animations created with built-in widgets, and make our way up to complex animated user interactions with advanced and customized widgets. Along the way, you will learn best practices, performance optimization, and tips on how to make your development experience and flow smoother.

Lastly, just like too much salt can ruin a meal, you don’t want to overcrowd or over-complicate your UI with too much animations, so we will end up our workshop with some important user experience tips to make sure your app has the most optimal impact on your users.''',
  ),
  Workshop(
    name: 'Theming from basics to advanced, the hard and the easy way',
    speaker: roaaKhaddam,
    duration: const Duration(minutes: 90),
    startTime: DateTime(2023, 9, 5, 13),
    location: noA(floor: 4),
    description: '''
In this workshop we go from basic light/dark Material 3 theme setup and defining the color system’s ColorScheme, using different ways to seed generate it, while respecting desired brand colors and increasing colorfulness. To, showing how to seed generate mono hue-based themes, that have only one brand color but are still color expressive.

We will explore best practices for customizing ThemeData, its TextTheme and text styles, how to use using semantic colors and customizing component themes in Material 3. How can we modify Material 3 defaults to make it less opinionated and more platform agnostic?

Next, we make the same design again, but this time by using the Themes Playground to visually configure the desired theme and reproduce what we first made manually with vanilla ThemeData. We will copy paste the FlexColorScheme API config code from the Themes Playground and let FCS produce the same ThemeData for us. We also go a step further and look at advanced options in the Playground, like platform adaptive theming.''',
  ),
  Workshop(
    name: 'Building a space shooter game with Flame',
    speaker: roaaKhaddam,
    duration: const Duration(minutes: 90),
    startTime: DateTime(2023, 9, 5, 13),
    location: noA(floor: 3),
    description: '''
In this session we will build an awesome and addictive space shooter game with Flutter and Flame engine.

You will learn about sprites, animations, gestures and input, collision detection, effects, the game loop, components, parallaxes and a lot more! In the end of the session you will have a playable game that you can continue to improve on.

You need no previous experience with Flame or Flutter to attend, a little Dart experience will help you a lot though.''',
  ),
  Workshop(
    name: 'Basic and advanced networking in Dart and Flutter',
    speaker: roaaKhaddam,
    duration: const Duration(minutes: 90),
    startTime: DateTime(2023, 9, 5, 13),
    location: devoteam,
    description: '''
Most applications, be it mobile, web, or desktop, depend on some kind of backend. Thus, an API layer is an integral part of application implementation.

I invite you to this hands-on workshop, where I will present tools and approaches that facilitate an effective API layer implementation in Flutter and Dart applications. We will apply this knowledge together to create a Flutter application that displays data obtained from hosted REST API.

You will walk away with knowledge about code generation in Dart and its application examples, and learn a few cool hacks on how to turn its principles to your advantage.''',
  ),
  Workshop(
    name: 'Leveraging AI to write quality code 5x faster',
    speaker: roaaKhaddam,
    duration: const Duration(minutes: 90),
    startTime: DateTime(2023, 9, 5, 15),
    location: devoteam,
    description: '''
We're living in the interesting times of ChatGPT where AI is capable of writing code just like humans. In this hands-on workshop, we will be seeing how we as Flutter Developers can embrace AI to increase our efficiency by together using AI to automate tasks like building widgets, writing and refactoring business logic and adding tests to our code.

We'll be looking at AI tools specialized for Flutter, while also exploring challenges like syntax, hallucination, deprecated code, and code security in LLMs. The goal of the workshop is to explore how AI is here to empower us by taking care of repetitive work and helping us build stronger codebases with ease.''',
  ),
  Workshop(
    name: 'Voice-enabled apps',
    speaker: akankshaSingh,
    duration: const Duration(minutes: 90),
    startTime: DateTime(2023, 9, 5, 15),
    location: noA(floor: 4),
    description: '''
Join us in an enlightening workshop where we plunge into the realm of conversational AI and its harmonious fusion with Flutter apps. Traverse through real-world applications and unravel the toolkit and strategies that seamlessly weave voice interaction into your projects. Together we'll uncover how this innovation adds a 'dash' of futuristic charm to your creations while amplifying their accessibility and reach.

Voice-enabled apps offer an elevated user experience by minimizing the effort needed for typing and navigation, making them perfect companions for multitasking and accessibility. Let's explore how we can effortlessly achieve this and transform our apps.''',
  ),
];
