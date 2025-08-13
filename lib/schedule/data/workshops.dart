import 'package:flutter_and_friends/schedule/schedule.dart';

const aiTrack = Location(
  name: 'AI Track',
  coordinates: (59.3308268, 18.0633923),
);

const dashTrack = Location(
  name: 'Dash Track',
  coordinates: (59.3308268, 18.0633923),
);

final workshops = <Workshop>[
  Workshop(
    name: 'Build Your Own Flutter AI Sidekick',
    speakers: const [moritzTheis],
    duration: const Duration(minutes: 90),
    startTime: DateTime(2025, 9, 2, 10),
    location: aiTrack,
    description: '''
In this hands-on workshop, we'll build a tiny AI assistant that lives inside a Flutter app—think of it as a “mini ChatGPT” tailored to a specific theme like travel, cooking, or even Flutter documentation.

We'll kick things off with the basics, set everyone up with cloud credits, and provide boilerplate code to help you hit the ground running. The entire workshop will be built using the Google tech stack—including Flutter, Firebase, and Vertex AI—so you'll get practical experience with powerful, production-ready tools.

From there, it's up to you: each participant will create their own personal AI sidekick for a unique purpose.

At the end, we'll showcase our creations and vote on the most impressive, weirdest, or funniest sidekick. Prizes await the winners!

What You'll Learn:

How to integrate AI capabilities into a Flutter app on basis of the Google-AI-Tech-Stack

Basics of using Vertex AI and Firebase for custom LLM-powered experiences

Structuring conversational UI and managing AI prompts effectively

Tips for building fun, useful, or just plain weird AI sidekicks''',
  ),
  Workshop(
    name: 'Building Flutter Packages & Modules Visually',
    speakers: const [poojaBhaumik],
    duration: const Duration(minutes: 90),
    startTime: DateTime(2025, 9, 2, 10),
    location: dashTrack,
    description: '''
Developers often rely on packages and modules to extend functionality and keep projects modular. In this workshop, we'll showcase how pub package authors and Flutter teams can create reusable modules or packages with FlutterFlow and DreamFlow and add them to existing Flutter projects.

We'll explore:

- How to edit an existing Flutter project using DreamFlow, a browser-based dev environment tailored for Flutter workflows, offering multiple ways to work, whether through code, visual editing, or AI-assisted prompts.

- How to encapsulate UI components and business logic into reusable libraries using FlutterFlow, a visual development environment for building Flutter apps and modules, that can be added as dependencies in existing Flutter projects.

- How Flutter teams building hybrid apps with add-to-app functionality can leverage FlutterFlow Libraries to create and reuse modules.

- How pub package authors can monetise their existing or future pub.dev packages by creating package wrappers and monetising them on the FlutterFlow Marketplace.

This workshop is targeted at Flutter developers, UI/UX designers, and open-source contributors looking to build scalable reusable solutions more efficiently and also unlock new monetisation opportunities in the Flutter ecosystem.''',
  ),
  Workshop(
    name: 'Build, organize, and review your widgets with Widgetbook',
    speakers: const [lucasJosefiak],
    duration: const Duration(minutes: 90),
    startTime: DateTime(2025, 9, 2, 13),
    location: dashTrack,
    description: '''
In this hands-on workshop, you'll learn how to build your widgets in isolation and organize them in your own widget library by using the open-source package Widgetbook. Disover how you can automatically detect and review all visual changes of your pull request with Widgetbook Cloud.''',
  ),
  Workshop(
    name: 'Hosting an AI Debate Club',
    speakers: const [sashaDenisov],
    duration: const Duration(minutes: 90),
    startTime: DateTime(2025, 9, 2, 13),
    location: aiTrack,
    description: '''
Welcome to the most exclusive club in tech: The AI Debate Club, hosted right inside your Flutter app! This workshop is your all-access pass to setting up lively (and autonomous) debates between different AI models. Forget boring integrations; we're building an arena for intelligent discourse, moderated only by code!

First, we'll construct the debate stage. Discover all the ways to bring your AI debaters into the Flutter ring: leveraging the Google SDK, Firebase Vertex AI, Firebase Genkit, and versatile REST APIs for powerful cloud-based contenders. We'll also explore setting up ringside seats using Edge AI with on-device models like Gemma, Deepseek, and Mistral Small, allowing debates to happen directly within the app, lightning-fast and even offline!

No debate club is complete without its opinionated members! We'll invite today's top AI debaters like Gemini, ChatGPT, Gemma, and Claude to join. We'll analyze their unique debating styles (capabilities) and potential membership fees (pricing) to figure out who argues best for your specific app's needs and topics.

For the grand finale -- the main event! Together, we'll build and unleash the ultimate AI Debate Club application. Witness multiple AI models autonomously interact, respond to each other, and perhaps even "argue" their points – all orchestrated within Flutter, with no human intervention required once the debate begins!

Expect plenty of fun and 'aha!' moments as we push the boundaries of AI collaboration in Flutter. You'll leave not just inspired, but fully equipped to host your own AI debates and bring truly dynamic, cutting-edge, and maybe even slightly chaotic AI experiences to your users.''',
  ),
  Workshop(
    name: 'Flutter Vibes Only: Join Us for the Flutter Vibe-Coding Workshop',
    speakers: const [ivannaKacevica, esraKadah],
    duration: const Duration(minutes: 90),
    startTime: DateTime(2025, 9, 2, 15),
    location: aiTrack,
    description: '''
What is the state of vibe-coding with Flutter in late 2025?

Let's find out together in this 120-minute speed hackathon, organized by two Flutteristas and active contributors in the Flutter x AI space—Ivanna and Esra!

For anyone curious about how AI can transform their Flutter workflow (welcoming both vibe-coding veterans and total first-timers), this is a playful, high-energy session focused on experimentation, collaboration, and pushing your limits. During the session, you'll race against the clock to build a specific target app using AI prompts to generate your code. Whether you're just starting out or already experimenting with AI, you'll leave with real hands-on experience.

Is Flutter already "there" when it comes to vibe-coding possibilities? Bring your laptop, your curiosity, and your best vibes, and let's find out.

Key takeaways:

- Learn how to prototype Flutter apps rapidly using AI prompts

- Get inspired by real-time collaboration and peer feedback

- Rethink your Flutter workflow—code without actually coding

- Understand the current limitations of LLMs when coding in Dart''',
  ),
  Workshop(
    name: 'Flame 3D - Hands-On Workshop',
    speakers: const [luanNico, jochumVanDerPloeg],
    duration: const Duration(minutes: 90),
    startTime: DateTime(2025, 9, 2, 15),
    location: dashTrack,
    description: '''
Carefully crafted by the minds behind the project, Jochum (wolfenrain) and Luan (luanpotter), this is an introductory workshop to teach you the very basics to get you up and running with our new package `flame_3d` which allows you to build 3D games with Flame. This is intended for people with little to no prior experience with 3D games, in Flame or otherwise, but with maybe some experience with Flutter and Dart. The workshop will be focused on a practical and hands-on getting-something-done approach, rather than focusing on background math and theory that is handled for you by flame_3d.

We will walk you over how the basics and how to implement main concepts for your prototype, including:

* coordinate systems

* camera and projections

* objects and components

* meshes and materials

* lights

* bone animations

By the end of this workshop, you will build a very simple playground-style 3D third-person platformer game, using free assets from the internet, and incorporating basic lighting, control, and animations.

`flame_3d` is new and experimental, and there is lots to be done! This workshop will equip you to get up and running with the project, enabling you to actually contribute on GitHub and create something awesome with us.''',
  ),
];
