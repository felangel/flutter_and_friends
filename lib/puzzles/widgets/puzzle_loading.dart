import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PuzzleLoading extends StatelessWidget {
  const PuzzleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(6),
      child: SizedBox(
        height: 80,
        child: RiveAnimation.asset(
          'assets/rive/loading.riv',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
