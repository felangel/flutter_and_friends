import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzles/puzzles.dart';
import 'package:particles_flutter/particles_flutter.dart';

class PuzzlesPage extends StatelessWidget {
  const PuzzlesPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PuzzlesPage());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PuzzleListener(
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          leading: const BackButton(),
        ),
        body: Stack(
          children: [
            // Background particles
            CircularParticle(
              key: UniqueKey(),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              awayRadius: 80,
              numberOfParticles: 50,
              speedOfParticles: 0.5,
              particleColor: theme.colorScheme.surfaceTint.withOpacity(0.2),
              awayAnimationDuration: const Duration(milliseconds: 150),
              maxParticleSize: 10,
              isRandSize: true,
              isRandomColor: true,
              randColorList: [
                theme.colorScheme.surfaceTint.withOpacity(0.2),
              ],
              awayAnimationCurve: Curves.easeInOutBack,
              enableHover: true,
              hoverColor: theme.primaryColor,
              hoverRadius: 90,
            ),
            const PuzzlesPageContent(),
          ],
        ),
      ),
    );
  }
}
