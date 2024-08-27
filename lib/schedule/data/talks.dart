import 'package:flutter_and_friends/schedule/schedule.dart';

const mainStage = Location(
  name: 'Main Stage',
  coordinates: (59.3318138, 18.0589957),
);
const studioStage = Location(
  name: 'Studio Stage',
  coordinates: (59.3318138, 18.0589957),
);

final talks = <Talk>[
  Talk(
    name: 'Keynote - Empathetic Flutter',
    speakers: const [craigLabenz],
    duration: const Duration(minutes: 45),
    startTime: DateTime(2024, 9, 2, 9, 30),
    location: mainStage,
    description: '''
Explore how Flutter developers can use the best qualities of our technology and community to develop unparalleled software.''',
  ),
  Talk(
    name: 'Learning something about Dart performance by optimizing jsonDecode',
    speakers: const [vyacheslavEgorov],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2024, 9, 2, 10, 20),
    location: mainStage,
    description: '''
This talks takes us on a journey through the layers of the cake called "Dart". We often hear that jsonDecode is slow in Dart - can we make it faster? Where do we start?

We will look at the Dart core libraries and how they implement jsonDecode. We will take that code for a spin with a profiler and learn how to diagnose performance issues using low-level tools.''',
  ),
  Talk(
    name: 'Inside Jaspr: Building a Dart web framework from scratch',
    speakers: const [kilianSchulte],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2024, 9, 2, 10, 20),
    location: studioStage,
    description: '''
Join me to take an inside look into Jaspr, the web framework for Dart developers. We will dive into the intricate details of the framework and how it works under the hood.
Learn how Jaspr is made and what it takes to develop a framework from scratch.

Whether you are a seasoned developer or newcomer to Dart, this session lets you step into the next area of Dart development - the web.''',
  ),
  Talk(
    name: 'Flutter web superfast: WASM',
    speakers: const [renanAraujo],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2024, 9, 2, 11, 10),
    location: mainStage,
    description: '''
Understand how WASM compilation can turn the tables on the Flutter web performance front.''',
  ),
  Talk(
    name: 'Practical Design Patterns for Flutter Development',
    speakers: const [majidHajian],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2024, 9, 2, 11, 10),
    location: studioStage,
    description: '''
Design patterns, inspired by architectural principles and adapted for software development, are crucial for modern app architecture.Based on the "FlutterEngineering" book, this talk highlights essential design patterns in Flutter to help you build efficient and scalable apps.In this talk, we'll explore fundamental concepts and focus on key patterns like Singleton, Factory, and Observer. You'll learn how to implement these patterns effectively in your Flutter projects through practical insights and real-world examples.''',
  ),
  Talk(
    name:
        '''Zero runtime errors: Exploring Static Code Analysis techniques in Flutter''',
    speakers: const [darjaOrlova],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2024, 9, 2, 13),
    location: mainStage,
    description: '''
If you ask a developer whether they would prefer to fix a bug or develop a new feature, there is no doubt they will select the latter.Unfortunately, bugs are part of the development cycle and are inevitable.Fortunately, there are techniques to predict and prevent them, even without running the code: with the help of static code analysis.Static code analysis is a powerful tool for finding and fixing potential errors even before compiling your code, making the cycle much faster and developers more productive. Moreover, the flexibility of this tool allows you to configure it in a way to not only control bugs but also code style and specific team practices.In this talk, we will do a deep dive into the world of static code analysis, exploring strategies on how to set it up to work best in your project, possibilities beyond `flutter_lints`, such as other libraries and 3rd party services like Dart Code Metrics, as well as what it takes to create your own custom lints for your library or app with tools such as `custom_lint`. By the end of this talk, you will be fully equipped to set up a robust static analysis system in your project and make your projects more reliable, consistent, and performant.''',
  ),
  Talk(
    name:
        '''Embedded Flutter on Raspberry Pi 5: Simplification of Daily E-Commerce Operations''',
    speakers: const [michalGapinski],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2024, 9, 2, 13),
    location: studioStage,
    description: '''
At Pineboards, we specialize in embedded solutions for the Raspberry Pi ecosystem, especially around PCI Express (NVMe, networking, AI Edge TPUs etc). Last year marked our venture into direct retail, pushing us from our engineering comfort zone into the realms of order fulfillment. Our journey from manual inefficiencies to streamlined processes was powered by a custom Flutter application, centralizing operations from order listing to shipping label generation.

In this session, you will discover how to implement:* Barcode Scanning Implementation: Explore the integration of hardware barcode scanners to ensure accurate order fulfillment.* Direct Printing with Flutter: Gain insights into controlling ZPL/EPL printers directly from Flutter for efficient label printing.* Kiosk Mode: Understand how to deploy a Flutter application in Kiosk mode on a custom OS image, enhancing the user interface for industrial applications.

Moreover, we'll take a look into how well Flutter behaves on the new Raspberry Pi 5 in comparison to macOS and provide a guideline for building custom hardware solutions powered by Flutter that are meant to last and work well in industrial environments.''',
  ),
  Talk(
    name: 'Making a 3D game with Flutter and Flame',
    speakers: const [luanNico],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2024, 9, 2, 13, 50),
    location: mainStage,
    description: '''
One year after my first talk exploring the realm of 3D within Flame, Flutter now has experimental support for first class GPU access for 3D rendering with Impeler.

In this talk we will explore that functionality using the `flame_3d` package to see what kind of simple 3D games are viable with Flame, learning the ropes around basic 3D rendering, camera, objects, and how to apply that to real life game development.''',
  ),
  Talk(
    name: 'Flutter & Threads',
    speakers: const [alexandreMoureaux],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2024, 9, 2, 13, 50),
    location: studioStage,
    description: '''
Does multithreading, rasterization, or processor affinity sound like big fancy words you'd love to understand? We'll explore all those terms together and discover how Flutter builds frames under the hood! You'll learn how this impacts your app's performance and how to make the correct choices to ensure a smooth app, with concrete code examples and demonstrations. This beginner-friendly talk will demystify complex concepts, guiding you through the threading model and empowering you to create highly performant Flutter apps.''',
  ),
  Talk(
    name: 'Quick Wins - how to make your app more accessible',
    speakers: const [simonAuer],
    duration: const Duration(minutes: 20),
    startTime: DateTime(2024, 9, 2, 14, 40),
    location: studioStage,
    description: '''
Did you know that you can actually make more accessible apps in flutter easily? If yes, why are you not doing that?

In some cases, apps are inaccessible because there is no time or budget for it, most of the time it is just because we never took the time to read up and learn about it.

In this talk, I don't want to aim at 100% accessibility, but tell you about some quick wins, you can follow without spending a lot of time on it and grow your potential audience almost for free by just knowing about it!

Just by joining this talk, you can potentially grant somebody access, who was unable to use your app before and maybe change their world!

And who knows? Maybe you fall in love with it and want to explore more afterwards. ;)''',
  ),
  Talk(
    name: '''Code Quality Gates for Large-Scale Flutter Apps''',
    speakers: const [pavelSulimau],
    duration: const Duration(minutes: 20),
    startTime: DateTime(2024, 9, 2, 14, 40),
    location: mainStage,
    description: '''
I'll share insights on guidelines and tools to maintain the quality of a Flutter app.

The talk will cover code quality aspects:

- structural, like code reviews and various static code analysis techniques including architecture tests

- functional, such as automated testing.

Code quality is important for projects of any size, but it's crucial for large-scale ones where tens of Flutter developers may work for years.''',
  ),
  Talk(
    name: '''Native Background Processing with Flutter''',
    speakers: const [dominikRoszkowski],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2024, 9, 2, 15, 40),
    location: studioStage,
    description: '''
Background processing tends to be one of the afterthoughts with Flutter apps, and I would love to change that. There are several ways to achieve it with Flutter or Dart, although some of them involve a bit of native platform understanding with a pinch of Kotlin or Swift. In this talk I’ll show you how to make it all work without losing your mind, even if you don't have any Android or iOS experience.This talk covers both iOS and Android background processing, with and without utilizing existing Flutter plugins. We'll try to look into desktop background processing as well.''',
  ),
  Talk(
    name: '''Automating Accessibility Adoption in Flutter using Gemini AI''',
    speakers: const [akankshaSingh],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2024, 9, 2, 15, 40),
    location: mainStage,
    description: '''
For years, accessibility features and experiences were seen as nice to have when it came to app development. Shockingly, many developers overlook this vital aspect, inadvertently excluding a significant user base. The World Health Organization reveals that about 15% of the global population, over a billion people, live with disabilities. In a digital age, it's unjust to marginalize this substantial demographic based on abilities.

This talk emphasizes the critical role of accessibility in mobile apps. By introducing the innovative use of Gemini AI as an AI-powered code assistance tool in IDEs like VS Code, we can address these issues head-on, ensuring that apps are accessible from the outset. Gemini AI serves as a game-changer, automating the detection and correction of accessibility issues in Flutter apps. This talk will empower developers and help them build apps that are inclusive and universally accessible.''',
  ),
  Talk(
    name: 'Code Meets Art: Flutter for Creative Coding',
    speakers: const [roaaKhaddam],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2024, 9, 2, 16, 30),
    location: mainStage,
    description: '''
In this talk, I want to show you how you can blur the lines between code and art using Flutter!

After a quick introduction into what creative coding is and how its visual feedback nature can be a great way to learn how to code, we’ll dive into the technical details on how Flutter can be used for that purpose. Starting from the custom painter and canvas API, and making our way into shaders and 3rd party tools and packages. Additionally, we will explore what it means to use algorithms to create Art and what happens when you bleed that art into user interfaces and experiences. Finally, with its cross platform capabilities and easy control over every pixel, we’ll answer the question of why use Flutter for this purpose in the first place.''',
  ),
  Talk(
    name: 'A closer look at the blur effect in Flutter',
    speakers: const [raoufRahiche],
    duration: const Duration(minutes: 20),
    startTime: DateTime(2024, 9, 2, 16, 30),
    location: studioStage,
    description: '''
Often, when we see a blur effect in designs, we just put in the values, add a backdrop widget, and copy those values, thinking it’s done. Since it’s blurry, it’s tricky to see if it’s right — but it’s “blurry,” so we move forward.

In this session, we'll dig deeper to understand what’s really going on behind the scenes with the blur effect in Flutter. We’ll use fragment shaders to try out different kinds of blurs and see the differences between them. By doing so, we can make them look just right in our designs.''',
  ),
  Talk(
    name: 'How big are macros really?',
    speakers: const [jochumVanDerPloeg],
    duration: const Duration(minutes: 20),
    startTime: DateTime(2024, 9, 2, 16, 50),
    location: studioStage,
    description: '''
This talk dives into the new experimental macro feature of the Dart language. What is it, what it can do and when to use it.''',
  ),
];

const craigLabenz = Speaker(
  name: 'Craig Labenz',
  title: 'Developer Relations Engineer at Google',
  avatar: 'assets/speakers/1_craig.jpeg',
  twitter: 'craig_labenz',
);

const vyacheslavEgorov = Speaker(
  name: 'Vyacheslav Egorov',
  title: 'Uber-TL of Dart at Google',
  avatar: 'assets/speakers/2_vyacheslav.jpg',
  twitter: 'mraleph',
);

const kilianSchulte = Speaker(
  name: 'Kilian Schulte',
  title: 'Flutter Engineer at Workerbase',
  avatar: 'assets/speakers/3_kilian.jpeg',
  twitter: 'schultek_dev',
);

const renanAraujo = Speaker(
  name: 'Renan Araujo',
  title: 'Software Engineer at Superlist',
  avatar: 'assets/speakers/4_renan.jpg',
  twitter: 'reNotANumber',
);

const majidHajian = Speaker(
  name: 'Majid Hajian',
  title: 'Author',
  avatar: 'assets/speakers/5_majid.jpg',
  twitter: 'mhadaily',
);

const michalGapinski = Speaker(
  name: 'Michał Gapiński',
  title: 'Founder and Software Engineer',
  avatar: 'assets/speakers/6_micha.png',
  twitter: 'mikegapinski',
);

const darjaOrlova = Speaker(
  name: 'Darja Orlova',
  title: 'Creator of NativePal',
  avatar: 'assets/speakers/7_darja.png',
  twitter: 'dariadroid',
);

const luanNico = Speaker(
  name: 'Luan Nico',
  title: 'Maintainer at Blue Fire',
  avatar: 'assets/speakers/8_luan.jpg',
  twitter: 'luanpotter27',
);

const alexandreMoureaux = Speaker(
  name: 'Alexandre Moureaux',
  title: 'Performance Expert at BAM',
  avatar: 'assets/speakers/9_alexandre.jpeg',
  twitter: 'almouro',
);

const simonAuer = Speaker(
  name: 'Simon Auer',
  title: 'CEO at Marqably',
  avatar: 'assets/speakers/10_simon.jpg',
  twitter: 'SimonEritsch',
);

const pavelSulimau = Speaker(
  name: 'Pavel Sulimau',
  title: 'Lead Software Engineer at EPAM Systems',
  avatar: 'assets/speakers/11_pavel.jpeg',
  twitter: 'PSulimau',
);

const akankshaSingh = Speaker(
  name: 'Akanksha Singh',
  title: 'Software Engineer at JP Morgan Chase & Co.',
  avatar: 'assets/speakers/12_akanksha.jpg',
  twitter: 'coder_jedi',
);

const dominikRoszkowski = Speaker(
  name: 'Dominik Roszkowski',
  title: 'Tech Lead at Visible, GDE in Flutter',
  avatar: 'assets/speakers/27_dominik.jpeg',
  twitter: 'OrestesGaolin',
);

const roaaKhaddam = Speaker(
  name: 'Roaa Khaddam',
  title: 'Flutter GDE, Software Engineer at Widgetbook',
  avatar: 'assets/speakers/13_roaa.png',
  twitter: 'roaakdm',
);

const raoufRahiche = Speaker(
  name: 'Raouf Rahiche',
  title: 'Software Engineer at EasyA',
  avatar: 'assets/speakers/14_raouf.jpeg',
  twitter: 'raoufrahiche',
);

const jochumVanDerPloeg = Speaker(
  name: 'Jochum van der Ploeg',
  title: 'Senior Open Source Engineer at Very Good Ventures',
  avatar: 'assets/speakers/15_jochum.jpeg',
  twitter: 'wolfenrain',
);

const sashaDenisov = Speaker(
  name: 'Sasha Denisov',
  title: 'Chief Software Engineer at EPAM',
  avatar: 'assets/speakers/16_sasha.jpg',
  twitter: 'ShuregDenisov',
);

const mikeDiarmid = Speaker(
  name: 'Mike Diarmid',
  title: 'CTO & Co-Founder @ Invertase',
  avatar: 'assets/speakers/17_mike.jpg',
  twitter: 'mikediarmid',
);

const moritzTheis = Speaker(
  name: 'Moritz Theis',
  title: 'CEO at Snapp X',
  avatar: 'assets/speakers/18_moritz.jpeg',
  twitter: 'MoritzTheis',
);

const payamZahedi = Speaker(
  name: 'Payam Zahedi',
  title: 'Senior Software Engineer at Snapp X',
  avatar: 'assets/speakers/19_payam.png',
  twitter: 'payamzahedi95',
);

const alfredoBautistaSantos = Speaker(
  name: 'Alfredo Bautista Santos',
  title: 'Flutter developer at Greenflux',
  avatar: 'assets/speakers/20_alfredo.png',
  twitter: 'alfredobs97',
);

const muhammedSalihGuler = Speaker(
  name: 'Muhammed Salih Güler',
  title: 'Senior Developer Advocate at AWS',
  avatar: 'assets/speakers/21_salih.png',
  twitter: 'salihgueler',
);

const cagatayUlusoy = Speaker(
  name: 'Çağatay Ulusoy',
  title: 'Flutter Competence Lead at Wolt',
  avatar: 'assets/speakers/22_cagatay.jpg',
  twitter: 'ulusoyapps',
);

const lucasJosefiak = Speaker(
  name: 'Lucas Josefiak',
  title: 'Co-Founder & CEO of Widgetbook',
  avatar: 'assets/speakers/23_lucas.png',
  twitter: 'LucasJosefiak',
);

const jensHorstmann = Speaker(
  name: 'Jens Horstmann',
  title: 'Co-Founder & CTO of Widgetbook',
  avatar: 'assets/speakers/24_jens.png',
  twitter: 'jens_hor',
);

const simonLightfoot = Speaker(
  name: 'Simon Lightfoot',
  title: 'CTO @ DevAngels',
  avatar: 'assets/speakers/28_simon.jpeg',
  twitter: 'devangelslondon',
);

const juliaBorkowska = Speaker(
  name: 'Julia Borkowska',
  title: 'Head of QA at LeanCode',
  avatar: 'assets/speakers/25_julia.jpg',
  twitter: 'julia_d_borko',
);

const mateuszWojtczak = Speaker(
  name: 'Mateusz Wojtczak',
  title: 'Head of Mobile at LeanCode',
  avatar: 'assets/speakers/26_mateusz.jpg',
  twitter: 'matiwojt',
);
