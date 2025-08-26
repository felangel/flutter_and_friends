import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class WaitingForNfcTap extends StatelessWidget {
  const WaitingForNfcTap._(this.progress);

  final ValueNotifier<double> progress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        padding: const EdgeInsets.all(24),
        child: ValueListenableBuilder(
          valueListenable: progress,
          builder: (context, progress, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: .12,
                  child: child,
                ),
                ClipPath(
                  clipper: RadialRevealClipper(revealPercent: progress),
                  child: child,
                ),
              ],
            );
          },
          child: const Icon(
            Icons.nfc,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  static Future<void> showLoading({
    required BuildContext context,
    required Stream<double> job,
  }) async {
    final completer = Completer<BuildContext>();
    final progressNotifier = ValueNotifier<double>(0);

    unawaited(
      showDialog<void>(
        context: context,
        builder: (context) {
          if (!completer.isCompleted) {
            completer.complete(context);
          }
          return WaitingForNfcTap._(progressNotifier);
        },
      ).then((_) {
        if (!completer.isCompleted) {
          completer.completeError(
            StateError('Dialog was dismissed before job completed'),
          );
        }
      }),
    );
    final dialogContext = await completer.future;
    try {
      await for (final result in job) {
        progressNotifier.value = result;
      }
    } catch (error) {
      rethrow;
    } finally {
      if (dialogContext.mounted) {
        Navigator.pop(dialogContext);
      }
    }
  }
}

/// A custom clipper that creates a radial wipe clipping path.
///
/// The sweep angle of the arc is determined by the [revealPercent].
class RadialRevealClipper extends CustomClipper<Path> {
  RadialRevealClipper({required this.revealPercent});

  final double revealPercent;

  @override
  Path getClip(Size size) {
    if (revealPercent >= 1.0) {
      return Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    }

    // Determine the center of the widget.
    final center = Offset(size.width / 2, size.height / 2);

    // Calculate the maximum radius required to cover the entire widget.
    final maxRadius = sqrt(pow(size.width / 2, 2) + pow(size.height / 2, 2));

    // Define the bounding rectangle for our arc.
    final rect = Rect.fromCircle(center: center, radius: maxRadius);

    // Calculate the sweep angle based on the reveal percentage. 2*pi is a full
    // circle.
    final sweepAngle = 2 * pi * revealPercent;

    // The starting angle of -pi/2 corresponds to 12 o'clock.
    const startAngle = -pi / 2;

    // Create the path for the pie-slice shape.
    final path = Path()
      // Move to the center to start the pie slice.
      ..moveTo(center.dx, center.dy)
      // Draw the arc for the given sweep angle.
      ..arcTo(rect, startAngle, sweepAngle, false)
      // Close the path to complete the slice.
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // We need to reclip whenever the reveal percentage changes.
    if (oldClipper is RadialRevealClipper) {
      return revealPercent != oldClipper.revealPercent;
    }
    return true;
  }
}
