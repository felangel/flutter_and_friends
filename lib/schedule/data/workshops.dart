import 'package:flutter_and_friends/schedule/schedule.dart';

const devoteam = Location(
  name: 'Devoteam',
  coordinates: (59.3308268, 18.0633923),
);
const noA = Location(
  name: 'NoA',
  coordinates: (59.3422061, 18.0620781),
);

const tbd = Location(
  name: 'TBD',
  coordinates: (59.3422061, 18.0620781),
);

final workshops = <Workshop>[
  Workshop(
    name: 'Porting your mobile app to TV platforms',
    speakers: const [sashaDenisov],
    duration: const Duration(minutes: 90),
    startTime: DateTime(2024, 9, 3, 10),
    location: devoteam,
    description: '''
Flutter officially supports six platforms (iOS, Android, Web, MacOS, Linux, and Windows). But what if you need to run the Flutter app on the TV platform? Unfortunately, TV platforms have no official support yet. But the Flutter app can be launched on some TV platforms.

In this workshop, we will go through all the steps of porting your mobile app to the big screen, discuss all the nuances of TV apps, such as controlling the app with a remote control, and finally launch the app on a TV platform, not only on Android TV, but also on Apple TV''',
  ),
  Workshop(
    name: 'Badge Hack',
    speakers: const [],
    duration: const Duration(hours: 6),
    startTime: DateTime(2023, 9, 3, 10),
    location: tbd,
    description: '''
Get together and hack something fun in Flutter with NFC! 👀

Do you want to make cool things like https://x.com/drcoderz/status/...?
This year at Flutter & Friends you will get the opportunity to! We will provide NFC tags for you to hack around with during the third day at the conference.

The sky is the limits to what you will be able to create with your friends 🎉💙''',
  ),
  Workshop(
    name: 'Learn how to build real-time games with Flutter and Dart Frog',
    speakers: const [mikeDiarmid, jochumVanDerPloeg],
    duration: const Duration(minutes: 90),
    startTime: DateTime(2024, 9, 3, 10),
    location: noA,
    description: '''
In this workshop you'll discover how fun it is to build a game with Flutter while also exploring real-time communication with Dart Frog.

You will learn the power of a unified tech stack, where your front-end shares logic with your back-end, using our favourite language Dart. Add a great developer experience to that and you have a recipe for success.

And the best part? You will have a fun game at the end of it that you can play with your friends! If that isn't the true meaning of Flutter & Friends, we don't know what is.''',
  ),
  Workshop(
    name: 'Beyond Mobile: Powering Embedded Devices with Flutter',
    speakers: const [moritzTheis, payamZahedi],
    duration: const Duration(minutes: 90),
    startTime: DateTime(2024, 9, 3, 10),
    location: noA,
    description: '''
This workshop dives into running Flutter on embedded devices, specifically setting it up on the brand new Raspberry Pi 5.

In 3 small groups we will set up Flutter on a Raspberry Pi 5, write our first small App for it and learn to control an externally connected servo-motor to dispense some delicious M&M's trough our Flutter-Application.

I will bring 3 Raspberry Pi 5's and touchscreens for the audience with me so that small groups can work interactively along while we go trough everything.

While the first 90 minutes are the same for all of the audience, the last 30 minutes can be used to explore and build something individual with the servo engines and the Raspberry Pi's for each group.''',
  ),
  Workshop(
    name: 'Flutter + Gemini: Your AI App Development Launchpad',
    speakers: const [alfredoBautistaSantos],
    duration: const Duration(minutes: 90),
    startTime: DateTime(2024, 9, 3, 13),
    location: devoteam,
    description: '''
Supercharge your Flutter apps with AI!

This workshop dives into Gemini, Google's cutting-edge large language model (LLM), and shows you how to seamlessly integrate it with Flutter. We'll break down LLMs, explore Gemini's multimodality, and build a real AI-powered Flutter app prototype – all from scratch! No prior experience needed, just bring your app idea and walk away with the skills to make it a reality.''',
  ),
  Workshop(
    name: 'Building a Cloud-Powered Diary Application with Flutter',
    speakers: const [muhammedSalihGuler],
    duration: const Duration(minutes: 90),
    startTime: DateTime(2024, 9, 3, 13),
    location: noA,
    description: '''
In today's world, having an idea is important, but going to market quickly is as important as having an idea. To achieve this, you need to support iOS, Android, Web, and even Desktop. Fortunately, Flutter is there to help you with that. However, an app without a backend is never enough. To power up your application with a scalable backend, AWS Amplify is there to help you out.

In this workshop, you will build a diary application in Flutter that targets iOS, Android, Web, and Desktop. The application will include Authentication, a GraphQL API with database connection, and File Storage. Additionally, there will be a bonus feature at the end, related to the hot topic of our times (starts with A and ends with I)! :)

Come join us and discover a new technology!''',
  ),
  Workshop(
    name: 'Advanced Flutter Navigation: Mastering Declarative Navigation',
    speakers: const [cagatayUlusoy],
    duration: const Duration(minutes: 90),
    startTime: DateTime(2024, 9, 3, 13),
    location: noA,
    description: '''
Implementing the navigation for complex multi-platform applications can be challenging due to varied user interface patterns and navigation structures across different platforms. Flutter’s Navigator 2.0, designed to streamline these complexities, offers a robust framework that empowers developers to manage navigation declaratively. While the Navigator 2.0 API may initially seem advanced and complex, understanding its interplay with the Router and Navigator widgets unlocks powerful customization and flexibility options. In this hands-on workshop, participants will dive deep into integrating the Model-View-ViewModel (MVVM) pattern in a layered architecture with Flutter’s Navigator 2.0 to create clear and efficient navigation management within their apps.

Workshop participants will embark on building a Flutter application from the ground up, learning to:

🔵 Implement the MVVM architectural pattern in conjunction with Flutter's Router widget to achieve reactive and declarative navigation.

🔵 Design and manage the application's navigation stack as an application state.

🔵 Utilize both declarative and imperative approaches to control modal route visibility.

🔵 Synchrozie the browser address bar and the app state for Flutter Web apps.

🔵 Synchronize imperative calls and declarative state changes to maintain consistent application state.

🔵 Integrate a bottom navigation bar selected tab management into the routing system.

🔵 Handle Android specific user interactions like back swipes and operating system back button presses.

🔵 Customize the SystemUIOverlayStyle to dynamically adjust UI elements like the status bar and navigation bar colors based on the active route.

🔵 Apply a layered approach to software architecture using MVVM principles to separate the concerns and build a maintainable, testable, and scalable app.

This workshop will equip developers with the skills to architect sophisticated navigation systems in Flutter applications, leveraging the advanced capabilities of Navigator 2.0 and the MVVM pattern for scalable and maintainable app development.''',
  ),
  Workshop(
    name:
        '''Flutter in the year 2044: Discussing a community plan for Flutter's next 20 years''',
    speakers: const [simonLightfoot],
    duration: const Duration(hours: 2),
    startTime: DateTime(2024, 9, 3, 15, 30),
    location: devoteam,
    description: '''
Flutter is open source, but it's still mainly a Google-driven project. Around 85% of active Flutter team devs are Googlers. Should we change this? Can we? Should there be a "Mozilla foundation" for Flutter?
To be clear, there is no indication that Google is dropping the ball. But since the projects has seen adoption so many businesses and people, maybe it's time for the community to take on a more active role?

The output of this workshop is a publicly shared document with ideas and TODO items (mostly for us, the community).''',
  ),
  Workshop(
    name: "Let's test it with Patrol!",
    speakers: const [juliaBorkowska, mateuszWojtczak],
    duration: const Duration(minutes: 90),
    startTime: DateTime(2024, 9, 3, 15, 30),
    location: noA,
    description: '''
During the workshop, we will prepare the whole E2E testing scenario using Patrol. You will learn how you can use Patrol finders to supercharge your tests and how you can test native features with Patrol native automation. As an example, we will test our Patrol challenge app with Firebase native interactions

At the end, we will show you how to run your tests on Firebase Test Lab.

As Patrol authors, we like to help people use the tool properly. We’ll cover the setup, troubleshooting, testing Flutter widgets, and E2E testing native stuff.

Preparation instructions:

We require attendees to have the latest stable Flutter SDK installed and have at least Android support – that means you should be able to build a Flutter app on Android and run it on the emulator (API 33) or their physical device.''',
  ),
  Workshop(
    name:
        '''Simplify Design Systems and Designer/Developer Collaboration with Widgetbook''',
    speakers: const [lucasJosefiak, jensHorstmann],
    duration: const Duration(minutes: 90),
    startTime: DateTime(2024, 9, 3, 15, 30),
    location: noA,
    description: '''
Creating beautiful UI has never been easier with Flutter. However, managing and organizing widgets effectively can pose challenges for developers, particularly when it comes to organizing them, testing them in all their different use cases, and maintaining design-code consistency. This is where Widgetbook comes in.

In this workshop, we will learn how to build our design system with the open-source Flutter package Widgetbook. We will combine it with Golden tests and Figma to establish a smooth UI review process with designers, developers, product managers and QA testers.

Key takeaways:

- How to build your own design system / widget library

- How to automatically test your widgets on different device sizes, themes, languages, etc.

- How to use Golden Tests without limitations

- How to collaborate effectively with designers and product managers to keep design and code sync''',
  ),
];
