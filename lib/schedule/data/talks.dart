import 'package:flutter_and_friends/schedule/schedule.dart';

const mainStage = Location(
  name: 'Main Stage',
  coordinates: (59.3318138, 18.0589957),
);
const exhibitionStage = Location(
  name: 'Exhibition Stage',
  coordinates: (59.3318138, 18.0589957),
);

final talks = <Talk>[
  Talk(
    name: 'Why and how we built code push for Flutter at Shorebird',
    speaker: felixAngelov,
    duration: const Duration(minutes: 40),
    startTime: DateTime(2023, 9, 4, 10, 10),
    location: mainStage,
    description: '''
In this talk we'll learn about what code push is, why it matters, how it works, and see it in action. Attendees should leave with a clear understanding of how to leverage Shorebird's code push solution in Flutter apps to provide over the air updates in seconds.''',
  ),
  Talk(
    name: 'The 6-Step Flex Layout Algorithm, for Humans',
    speaker: scottStoll,
    duration: const Duration(minutes: 40),
    startTime: DateTime(2023, 9, 4, 10, 50),
    location: mainStage,
    description: '''
RenderFlex errors? No problem. Whether the Flexible in the Flex is going to flex depends on the FlexFit of the Flexible, and if it is going to be flexible then the amount it will flex within the Flex depends on the flex of the Flexible. But if the FlexFit of the Flexible says to ignore the flex, then it's all meaningless because it won't do anything. Clear as mud, right?
This is the talk you've been waiting for since the day you started Flutter. This is the talk that translates all of this jibberish into something a human being can understand. See you there!''',
  ),
  Talk(
    name: 'Behavior Driven Development with Flutter',
    speaker: filipeABarroso,
    duration: const Duration(minutes: 40),
    startTime: DateTime(2023, 9, 4, 12, 10),
    location: mainStage,
    description: '''
If there is something that projects tend to ignore are TESTS. With the same mindset of Test Driven Development (TDD) we get Behavior Driven Development, but instead of writing tests we use a simple text definition for all tests with a language called Gherkin. With this talk you will learn the fundamentals of BDD, the reasoning behind them and we'll see how to implement it with Flutter!''',
  ),
  Talk(
    name: 'The runtime that makes Dart tick',
    speaker: vyacheslavEgorov,
    duration: const Duration(minutes: 40),
    startTime: DateTime(2023, 9, 4, 13),
    location: mainStage,
    description: '''
A talk about how the Dart Runtime runs Dart code. Maybe something about performance and optimisations. Maybe something about not very well known features of Dart runtime. Maybe something mindblowing about new features the Dart team is working on. More info TBA.''',
  ),
  Talk(
    name: 'From Network Failures to Offline Success: A Journey of Visible App',
    speaker: dominikRoszkowski,
    duration: const Duration(minutes: 40),
    startTime: DateTime(2023, 9, 4, 13, 40),
    location: mainStage,
    description: '''
Scaling an app to thousands of daily active users is a dream come true, but it also comes with its own set of challenges. At Visible, we quickly realized that some of our assumptions about network connectivity and stability were too optimistic. Even a 0.5% failure rate would result in dozens of complaints related to network issues every day.

In this talk, I will share how we overcame this challenge by enabling our app with full offline capability while continuously adding new features for our users. I will dive deep into the technical details, discussing topics like GraphQL caching, background processing, and local storage.

Join me as I share our journey and offer valuable insights for Flutter developers looking to tackle similar challenges.''',
  ),
  Talk(
    name: 'Supercharged UI testing with Patrol',
    speaker: mateuszWojtczak,
    duration: const Duration(minutes: 20),
    startTime: DateTime(2023, 9, 4, 13, 40),
    location: exhibitionStage,
    description: '''
Flutter UI integration testing can be really cumbersome, especially in a mobile app that also depends on the native side features. Unfortunately, the Flutter integration test fails when a native permission dialog appears or we’d like to interact with some native platform view.

That’s why we created Patrol - an open-source framework for testing Flutter apps - developed by LeanCode. With Patrol, you can write your UI tests in Dart (like you would with integration_test), but you are enabled to test interactions with the native side - tap on native views, browse WebViews, and even interact with some other app on the device.

In this talk, we’ll take a look at problems with integration testing, how Patrol solves them, and how you can use Patrol to supercharge your testing game.''',
  ),
  Talk(
    name:
        'Efficiency Unleashed: Streamline Flutter Project Setup like a Pro! 🚀',
    speaker: wiktoriaSobczyk,
    duration: const Duration(minutes: 20),
    startTime: DateTime(2023, 9, 4, 14),
    location: exhibitionStage,
    description: '''
Are you tired of spending countless hours on project setup? 😫
Look no further! This lightning talk will reveal the secrets to streamline your Flutter project setup like a pro. 💪 From fast setup flavors 🎨 and different icons 🖼️ to harnessing the power of code-generation techniques. 🧱🧱
Say goodbye 👋 to tedious setup tasks and hello to accelerated development! ⚡️ Get ready to embark on an exciting journey as we explore internationalization 🌍 and the game-changing potential of code generation. Don't miss out on this opportunity to unlock the full efficiency potential of Flutter project setup. Prepare to witness your productivity soar! 🚀''',
  ),
  Talk(
    name: 'A safe bridge to the native side',
    speaker: darjaOrlova,
    duration: const Duration(minutes: 40),
    startTime: DateTime(2023, 9, 4, 14, 45),
    location: mainStage,
    description: '''
Flutter is such an amazing cross-platform framework that it’s easy to forget about its connection with the underlying native platforms. For most of your Flutter journey, you won’t touch even a line of native code... until one day a client requires the use of an obscure SDK that doesn’t have a Flutter implementation, or you want to use that shiny new native feature before it gets official framework support. So, unwillingly, you reach for MethodChannels... but let me stop you right there. In this talk, I will show you a better, type-safe, and more enjoyable way to communicate with the native layer with the help of the pigeon code generation tool.''',
  ),
  Talk(
    name: 'Flutter on the Server: Why & How it is Interesting',
    speaker: jochumvanderPloeg,
    duration: const Duration(minutes: 20),
    startTime: DateTime(2023, 9, 4, 14, 45),
    location: exhibitionStage,
    description: '''
Running Flutter on the server has benefits people not often think about, this talk will explain different ways you can run Flutter headlesssly and why you should. The talk touches on gamedev, sharing code, machine learning and other areas. All while explaining the pros and cons of every part.''',
  ),
  Talk(
    name: 'Running Dart around the Globe',
    speaker: majidHajian,
    duration: const Duration(minutes: 20),
    startTime: DateTime(2023, 9, 4, 15, 05),
    location: exhibitionStage,
    description: '''
With Globe you can deploy Dart applications on a serverless global edge network with a seamless dev experience to help you easily deploy, scale & configure your Dart server applications. This talk will give you an introduction of how and why you should use it.''',
  ),
  Talk(
    name:
        '''Building a large-scale Flutter mobile banking application with 25 Flutter Devs''',
    speaker: albertWolszon,
    duration: const Duration(minutes: 40),
    startTime: DateTime(2023, 9, 4, 16),
    location: mainStage,
    description: '''
Building a large-scale Flutter mobile banking application with 25 Flutter Devs and 200 other team members has taught us many valuable lessons on how to set up such a project. We would like to give you our perspective on the organization of the project and challenges such as code ownership, communication, and design system, which are vital to ensure high productivity while keeping the team happy.''',
  ),
  Talk(
    name:
        '''Building a large-scale Flutter mobile banking application with 25 Flutter Devs''',
    speaker: mateuszWojtczak,
    duration: const Duration(minutes: 40),
    startTime: DateTime(2023, 9, 4, 16),
    location: mainStage,
    description: '''
Building a large-scale Flutter mobile banking application with 25 Flutter Devs and 200 other team members has taught us many valuable lessons on how to set up such a project. We would like to give you our perspective on the organization of the project and challenges such as code ownership, communication, and design system, which are vital to ensure high productivity while keeping the team happy.''',
  ),
  Talk(
    name:
        '''Supercharged Design System: Enhancing Widget Cataloging, Testing, and Collaboration with designers''',
    speaker: lucasJosefiak,
    duration: const Duration(minutes: 20),
    startTime: DateTime(2023, 9, 4, 16),
    location: exhibitionStage,
    description: '''
Creating beautiful UI has never been easier with Flutter. However, managing and organizing widgets effectively can pose challenges for developers, particularly when it comes to organizing them, testing them in all their different use cases, and maintaining design-code consistency. This is where Widgetbook comes in.

In this talk, we will see how we can use the open-source Flutter package Widgetbook to build our own design system/widget library and test our widgets across different devices, themes, and languages. We will connect our Figma designs directly to our Flutter widgets and set up a CI/CD integration with Widgetbook that simplifies the review process with designers. Thereby, we will learn how to keep design and code sync.

Key takeaways:

- How to build your own design system / widget library

- How to quickly test your widgets on different device sizes, themes, languages, etc.

- How to collaborate effectively with designers to keep design and code sync''',
  ),
  Talk(
    name:
        '''Breaking Barriers in Energy App Development with Flutter and Dart Frog''',
    speaker: maherJaafar,
    duration: const Duration(minutes: 20),
    startTime: DateTime(2023, 9, 4, 16, 20),
    location: exhibitionStage,
    description: '''
Our Solar Cell Charging App’s notable features include utilizing two APIs with a backend built in Dart Frog, implementing HydratedBlocs for data persistence, employing Flutter isolates for real-time updates, reverse engineering the excisting backend API for comprehensive integration, utilizing Shorebird for seamless code push on Android, and creating a visually consistent power flow using a custom painter.''',
  ),
  Talk(
    name:
        '''Breaking Barriers in Energy App Development with Flutter and Dart Frog''',
    speaker: antonIjas,
    duration: const Duration(minutes: 20),
    startTime: DateTime(2023, 9, 4, 16, 20),
    location: exhibitionStage,
    description: '''
Our Solar Cell Charging App’s notable features include utilizing two APIs with a backend built in Dart Frog, implementing HydratedBlocs for data persistence, employing Flutter isolates for real-time updates, reverse engineering the excisting backend API for comprehensive integration, utilizing Shorebird for seamless code push on Android, and creating a visually consistent power flow using a custom painter.''',
  ),
  Talk(
    name: 'Building Voice-Enabled Flutter Apps: A Comprehensive Guide',
    speaker: akankshaSingh,
    duration: const Duration(minutes: 40),
    startTime: DateTime(2023, 9, 4, 16, 40),
    location: mainStage,
    description: '''
With the rapid acceleration of digital technology adoption during the COVID-19 pandemic, conversational AI solutions, including chatbots, virtual agents, and voice assistants, have gained significant popularity.

Phrases like 'Hey, Google!' and 'Ok, Google' have become some of the earliest words learned by children in today's generation. The preference for voice interaction with virtual assistants is growing rapidly, offering convenience to millions by saving time and reducing the cognitive burden associated with typing queries or tasks.

In this engaging talk, we will explore the diverse use cases of conversational AI and delve into the various methods and packages available to seamlessly integrate this powerful functionality into Flutter apps. By incorporating conversational AI, not only can you enhance the user experience, but you can also make your apps more accessible to a wider audience.''',
  ),
  Talk(
    name: 'What hit tests really are',
    speaker: kamilKlyta,
    duration: const Duration(minutes: 20),
    startTime: DateTime(2023, 9, 4, 16, 40),
    location: exhibitionStage,
    description: '''
In this talk we will answer some questions such as:

What are hit tests? How do they work? What do we use them for? Why do they work differently on the web and on mobile devices? Why are there native events, raw gesture detectors, gesture detectors or gesture arenas 🤯‽.

And finally, why they matter and why we need to think about gestures when developing applications.''',
  ),
];

const felixAngelov = Speaker(
  name: 'Felix Angelov',
  title: 'Founding Engineer at Shorebird',
  avatar: 'assets/speakers/1_felix.jpg',
  twitter: 'felangelov',
);
const majidHajian = Speaker(
  name: 'Majid Hajian',
  title: 'Head of DevRel at Invertase',
  avatar: 'assets/speakers/2_majid.jpg',
  twitter: 'mhadaily',
);

const vyacheslavEgorov = Speaker(
  name: 'Vyacheslav Egorov',
  title: 'Dart Lead (AOT & JIT) at Google',
  avatar: 'assets/speakers/3_vyacheslav.jpg',
  twitter: 'mraleph',
);

const akankshaSingh = Speaker(
  name: 'Akanksha Singh',
  title: 'Software Engineer at J.P. Morgan',
  avatar: 'assets/speakers/4_akanksha.jpg',
  twitter: 'coder_jedi',
);

const dominikRoszkowski = Speaker(
  name: 'Dominik Roszkowski',
  title: 'Flutter GDE / Lead Mobile Engineer at Visible',
  avatar: 'assets/speakers/5_dominik.png',
  twitter: 'OrestesGaolin',
);

const darjaOrlova = Speaker(
  name: 'Darja Orlova',
  title: 'Mobile Tech Lead at Chili Labs',
  avatar: 'assets/speakers/6_darja.jpg',
  twitter: 'dariadroid',
);

const scottStoll = Speaker(
  name: 'Scott Stoll',
  title: 'Founder, Good Dog Apps',
  avatar: 'assets/speakers/7_scott.jpg',
  twitter: 'scottstoll2017',
);

const lucasJosefiak = Speaker(
  name: 'Lucas Josefiak',
  title: 'CEO & Co-Founder at Widgetbook',
  avatar: 'assets/speakers/9_lucas.jpg',
  twitter: 'LucasJosefiak',
);

const wiktoriaSobczyk = Speaker(
  name: 'Wiktoria Sobczyk',
  title: 'Senior Flutter Developer at itCraft',
  avatar: 'assets/speakers/10_wiktoria.jpg',
  twitter: 'wiktoria-sobczyk',
);

const albertWolszon = Speaker(
  name: 'Albert Wolszon',
  title: 'Senior Flutter Developer at LeanCode',
  avatar: 'assets/speakers/11_albert.jpg',
  twitter: 'albert_wolszon',
);

const mateuszWojtczak = Speaker(
  name: 'Mateusz Wojtczak',
  title: 'Head of Mobile at LeanCode',
  avatar: 'assets/speakers/11_mateusz.jpg',
  twitter: 'matiwojt',
);

const filipeABarroso = Speaker(
  name: 'Filipe A. Barroso',
  title: 'Senior Flutter Developer at Teya',
  avatar: 'assets/speakers/12_filipe.jpg',
  twitter: 'ABarroso',
);

const kamilKlyta = Speaker(
  name: 'Kamil Klyta',
  title: 'Flutter Developer at HTD',
  avatar: 'assets/speakers/13_kamil.jpg',
);

const jochumvanderPloeg = Speaker(
  name: 'Jochum van der Ploeg',
  title: 'Senior Open Source Engineer at Very Good Ventures',
  avatar: 'assets/speakers/14_jochum.jpg',
  twitter: 'wolfenrain',
);

const antonIjas = Speaker(
  name: 'Anton Ijäs',
  title: 'COO & Co-Founder at Hackberry',
  avatar: 'assets/speakers/20_anton.jpg',
  twitter: 'anton_ijas',
);

const maherJaafar = Speaker(
  name: 'Maher Jaafar',
  title: 'Senior Flutter Engineer at Hackberry',
  avatar: 'assets/speakers/21_maher.jpg',
  twitter: 'flutterengineer',
);

const annaLeushchenko = Speaker(
  name: 'Anna Leushchenko',
  title: 'Senior Staff Mobile Engineer at Tide',
  avatar: 'assets/speakers/15_anna.png',
  twitter: 'AnnaLeushchenko',
);

const mikeRydstrom = Speaker(
  name: 'Mike Rydstrom',
  title: 'CTO at Eneron Oy',
  avatar: 'assets/speakers/16_mike.jpg',
  twitter: 'RydMike',
);

const roaaKhaddam = Speaker(
  name: 'Roaa Khaddam',
  title: 'Flutter & Dart GDE / Software Engineer at Widgetbook',
  avatar: 'assets/speakers/17_roaa.jpg',
  twitter: 'roaakdm',
);

const samyakJain = Speaker(
  name: 'Samyak Jain',
  title: 'Founder at Welltested AI',
  avatar: 'assets/speakers/19_samyak.jpg',
  twitter: 'samyakjain963',
);

const lukasKlingsbo = Speaker(
  name: 'Lukas Klingsbo',
  title: 'Open Source Engineer at Blue Fire',
  avatar: 'assets/speakers/18_lukas.jpg',
  twitter: 'spydon',
);
