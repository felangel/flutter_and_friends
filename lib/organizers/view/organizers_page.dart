import 'package:flutter/material.dart';
import 'package:flutter_and_friends/organizers/organizers.dart';

class OrganizersPage extends StatelessWidget {
  const OrganizersPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const OrganizersPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Organizers')),
      body: const OrganizersView(),
    );
  }
}

class OrganizersView extends StatelessWidget {
  const OrganizersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrganizersGridView(organizers: organizers);
  }
}

class OrganizersGridView extends StatelessWidget {
  const OrganizersGridView({required this.organizers, super.key});

  final List<Organizer> organizers;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.crossAxisCount,
        mainAxisSpacing: 12,
      ),
      padding: const EdgeInsets.all(12),
      itemCount: organizers.length,
      itemBuilder: (context, index) => OrganizerAvatar(
        organizer: organizers[index],
      ),
    );
  }
}

extension on BuildContext {
  int get crossAxisCount {
    final width = MediaQuery.of(this).size.width;
    if (width < 600) return 2;
    if (width < 800) return 3;
    return 4;
  }
}
