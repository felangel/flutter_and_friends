import 'package:flutter_and_friends/schedule/schedule.dart';
import 'package:flutter_and_friends/speakers/speakers.dart';

const mainStage = Location(
  name: 'Main Stage',
  coordinates: (59.3317657, 18.0637531),
);
const studioStage = Location(
  name: 'Studio Stage',
  coordinates: (59.3317657, 18.0637531),
);

final talks = <Talk>[
  Talk(
    name: 'The Boring Keynote',
    speakers: const [filipHracek],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2025, 9, 1, 9, 30),
    location: mainStage,
    description:
        '''This talk celebrates the "boring" features of Flutter & Dart that don't normally get all that attention but that are at least as important as the big ticket features. The things that are important for big production projects aren't necessarily the same ones as those important for demos.''',
  ),
  Talk(
    name: 'What is an Isolate anyway?',
    speakers: const [slavaEgorov],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2025, 9, 1, 10, 15),
    location: mainStage,
    description:
        '''This is a talk about the past, present and future of the Dart concurrency model. How and why did Dart end up with Isolates? How did they evolve over the years and where we are taking them in the future.''',
  ),
  Talk(
    name: 'Making your app WCAG 3.0 compliant in 40 minutes!',
    speakers: const [enzoConty],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2025, 9, 1, 10, 15),
    location: studioStage,
    description:
        '''In this session, we will break down WCAG 3.0 guidelines and show you actionable steps to make your app fully accessible in 40 minutes. You'll learn how to audit, fix, and test common accessibility issues, ensuring the experience for everyone, including people with various disabilities. We will take a deep dive into some complex accessibility challenges like accessible charts, keyboard support and even image descriptors.''',
  ),
  Talk(
    name: 'Visualizing Algorithms on the Flutter Canvas',
    speakers: const [roaaKhaddam],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2025, 9, 1, 11),
    location: mainStage,
    description: '''
Throughout the history of computing, layer upon layer of abstraction has been introduced to the way we build software. From writing raw machine code, to abstracting away the writing of the code itself. This talk is about building a deeper understanding of the core ideas and algorithms that persisted through these layers.

And what better way to understand complex logic than to watch it come to life and interact with it?

With Flutter as our canvas of choice, we'll explore interactive simulations of algorithms in a variety of complexity and domains, from foundational computer science, to more complex algorithms that power systems we use every day as software engineers in general, and as Flutter developers in particular. And along the way, we'll dive into the Flutter APIs used to build those simulations.''',
  ),
  Talk(
    name: 'How to write a button if there was no Material (or Cupertino)',
    speakers: const [albertWolszon],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2025, 9, 1, 11),
    location: studioStage,
    description:
        '''When using components provided by the framework we don't pay attention to some of important parts of them that make them really production-grade. In this talk I'll go through developing a simple button in Flutter, but using the most primitive widgets and without using Material or Cupertino, and making the button still fully usable and accessible, to all users the app can have.''',
  ),
  Talk(
    name: "State management is hard. Here's why.",
    speakers: const [remiRousselet],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2025, 9, 1, 12, 45),
    location: mainStage,
    description: '''
A recurring comment you can find when discussing state-management is: "Why use X package when you could just use InheritedWidget/StatefulWidget/...?"

This is a valid question! Let's see together what the problems of state-management are, and why one might (or not) want to pick a package. This talk is not about any specific package in particular. It is a general discussion about a complex problem.

Prior programming experience is highly recommended. Knowledge about Dart/Flutter are good to have but not mandatory, as this discussion applies to all technologies to some extent.''',
  ),
  Talk(
    name: 'Is your app faster with "const"?',
    speakers: const [rudolfsAgrisStilve],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2025, 9, 1, 12, 45),
    location: studioStage,
    description: '''
Is it worth taking the time to pepper the "const" keyword everywhere possible, and is there a tangible end-user benefit? Small, isolated benchmarks can paint conclusions in one or the other way, but what about a complex real-world scenario? The basis of this talk is an experiment where the "const" keyword has been ejected from a near-100k LoC production app.

The audience will learn what using "const" results in a code-level, whether there is a benefit to doing so (spoiler: there is), and where the improvements come from.''',
  ),
  Talk(
    name: 'Using the MultiChildRenderObjectWidget',
    speakers: const [ingvildSandstad],
    duration: const Duration(minutes: 20),
    startTime: DateTime(2025, 9, 1, 13, 30),
    location: mainStage,
    description: '''
The talk will focus on how we can make quite simple use of the MultiChildRenderObjectWidget to solve having your own, specific layout rules for a set of widgets. We will look at some use cases where it could be useful, analyse some code and output of the results.

MultiChildRenderObjectWidget can help you take control of all sorts of layout issues and positioning widgets. This is particularly useful when working with accessibility and having to handle your layouts for portrait, landscape and enlarged display/text sizes. And with a little look at its inner workings you get to know how Flutter works a little better, and see that it really is quite simple to use, and very powerful.''',
  ),
  Talk(
    name: 'Behind the @ - Dart Annotations in Depth',
    speakers: const [annaLeushchenko],
    duration: const Duration(minutes: 20),
    startTime: DateTime(2025, 9, 1, 13, 30),
    location: mainStage,
    description: '''
As Flutter developers, you've almost certainly encountered annotations like `@override` and `@deprecated`. But Dart's annotation system offers much more than just these built-in cases, yet this feature remains underused in the majority of projects.

In this talk, we'll explore what annotations are, how to create custom ones, and how they can serve as code documentation, drive analyzer warnings, and power code generators. You'll learn to apply Dart annotations in ways that improve developer experience and code maintainability.''',
  ),
  Talk(
    name: 'Architecting for 15 Million Users',
    speakers: const [morganHunt],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2025, 9, 1, 14),
    location: studioStage,
    description: '''
Scaling an app to millions of users requires more than just writing efficient code—it demands a solid architectural foundation that balances performance, maintainability, and developer experience. In this talk, I'll break down key architectural decisions that enable apps to scale while keeping the codebase modular, testable, and maintainable.

Attendees will learn how to:

- Structure projects with multiple Dart/Flutter packages to reduce dependency conflicts and leverage concurrency.

- Implement dependency injection to improve testability and maintain clean abstractions.

- Design navigation and screen organization strategies to simplify deep linking and prevent naming conflicts.

- Manage shared state across multiple Bloc instances while maintaining persistence and reactivity.

By the end of this session, they'll have a deeper understanding of scalable Flutter architecture and practical techniques to build apps that stand the test of scale.''',
  ),
  Talk(
    name: 'Mastering Efficiency in 2025: Build Apps Faster with Flutter',
    speakers: const [mateuszWojtczak],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2025, 9, 1, 14),
    location: mainStage,
    description: '''
The mobile landscape is evolving rapidly. In 2025, efficiency reigns supreme. This talk cuts through the noise and delivers a practical roadmap for building high-quality Flutter apps with less effort. We'll explore proven strategies for maximizing your productivity, including:

The Power of Reuse: Don't start from scratch! Learn how to leverage a vast library of pre-built components, UX patterns, and logic, gleaned from over 40 real-world projects. We've already solved common problems like forms, side effects, and testing – you can tap into this wealth of knowledge to accelerate development and ensure consistency.

Design Systems, Simplified: Unlock the power of design systems with the LeanCode Design System Blueprint. This ready-to-use foundation provides a customizable framework for achieving UI consistency and boosting brand representation, regardless of project size.

Flutter Web: Explore the maturity of Flutter Web and build truly universal applications that seamlessly target both mobile and web platforms from a single codebase.

AI-Powered Development, On Your Terms: Harness the power of AI code generation without compromising on compliance or security. We'll demonstrate how LeanCode leverages AI models to enhance your workflow while addressing concerns about cloud usage and data privacy.

At the end of the talk, we'll show what we could build within less than a day of development using all of our LeanCode tech stack gems!''',
  ),
  Talk(
    name: 'Flame and shaders: The post processing API',
    speakers: const [renanAraujo],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2025, 9, 1, 15, 45),
    location: mainStage,
    description: '''
The new post-processing API on Flame promises to allow Flutter-based games to look as good as any of the best-looking 2D games in the industry. Let's see how with never-before-seen examples.''',
  ),
  Talk(
    name: 'Either This or That: Expressive Error Handling in Dart',
    speakers: const [eliasElfarri],
    duration: const Duration(minutes: 15),
    startTime: DateTime(2025, 9, 1, 15, 45),
    location: studioStage,
    description: '''
Functional programming patterns like Either and Result are widely used in languages like Rust, Haskell, and Go to enable safe, expressive, and explicit error handling. However Dart doesn't support this pattern out of the box—so at InlineX, we decided to build it ourselves.

In this session, we'll explore how I implemented and extended our Either<Success, Failure> type in Dart, bringing functional-style, monadic chaining and expressive error-handling to a language that wasn't built for it. Starting from a basic Either class with a simple when() method, I've now introduced a suite of ergonomic helper methods and transformations to make the pattern easier to use in real-world apps—from mapSuccess() and mapFailure() to successOrNull(), doOnFailure() and much much more.

I'll walk you through how we used functional principles—like pure functions, monads, and pattern matching—while staying true to Dart's idioms. Expect real-world use cases where chaining Either calls leads to cleaner, safer code, without constantly checking for null or wrapping everything in try/catch blocks.

Finally, we'll also touch on naming decisions and how adapting familiar functional concepts like tap, fold, and flatMap into Dart-flavored APIs improves developer experience and code readability—without sacrificing expressive power.

If you've ever wished Dart had a first-class way to deal with fallible operations, or you're curious how functional patterns can be applied pragmatically in Flutter apps, this talk is for you.''',
  ),
  Talk(
    name: 'Test Semantics with Golden Tests',
    speakers: const [sandraLundh],
    duration: const Duration(minutes: 20),
    startTime: DateTime(2025, 9, 1, 16, 10),
    location: studioStage,
    description: '''
While semantics aren't visible to the average user, they are essential for users relying on screen readers. So visualising their impact, like how semantics affect your UI, gives you indirect visibility into how accessible your app is.

Typically, semantics are tested with unit or widget tests. But here's the thing: those tests can be time-consuming and I find myself parsing dense logs to understand what's going on.

The solution: Golden tests.

In my talk I'll showcase how you can use goldens tests to display the accessibility structure of widgets, which makes your tests instantly digestible, not only for you but also for your team.''',
  ),
  Talk(
    name:
        '''Flutter Goes to Sea - Building Next Generation Marine Interfaces in Flutter''',
    speakers: const [martinOlsson],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2025, 9, 1, 16, 35),
    location: studioStage,
    description: '''
Candela builds boats that fly. The Candela P-12 is the world's first electric hydrofoiling ferry, now in public service in Stockholm and beyond. While the tech that makes her fly across the water is complex, driving her is simple - thanks to genius-level control systems and a Flutter-powered UI.

The driver interface works hand-in-hand with physical controls and traditional marine instruments. It communicates over CAN bus and MQTT to provide real-time data from sensors and flight systems. Telemetry is also streamed to the Candela Cloud, enabling operators to gain deep insights and analytics.

In this talk, you'll learn why we chose Flutter - and how it helped a small team craft an intuitive, beautiful experience for professional captains. We also use Flutter to build the mobile companion app for our leisure boats.''',
  ),
  Talk(
    name: 'The Flutter Grimoire: A Practical Guide to Your First PR',
    speakers: const [jamieKerber],
    duration: const Duration(minutes: 40),
    startTime: DateTime(2025, 9, 1, 16, 35),
    location: mainStage,
    description: '''
In this talk we'll demystify the secrets of contributing to Flutter with a clear, phase-by-phase walkthrough designed to turn intimidation into inspiration. You'll discover how contributing sharpens your skills and creates an impact—whether you're fixing long-standing bugs, improving widgets or documentation, or adding new features.

By the end of this session, you'll possess repeatable practices and concrete examples to guide you through every step of the Flutter contribution process with confidence and magical purpose~

Target Audience: Beginner/Intermediate Flutter developers who've already built apps and are ready to get to the next level!''',
  ),
];
