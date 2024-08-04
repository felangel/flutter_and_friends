import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_and_friends/puzzles/helper/duration_extension.dart';

class TimeCounter extends StatefulWidget {
  const TimeCounter({
    required this.date,
    super.key,
    this.text,
    this.refreshPuzzles,
  });

  final DateTime date;
  final String? text;
  final VoidCallback? refreshPuzzles;

  @override
  State<TimeCounter> createState() => _TripCounterTextState();
}

class _TripCounterTextState extends State<TimeCounter> {
  String? counterTime;
  Timer? timer;

  void updateTime() {
    timer = Timer.periodic(const Duration(minutes: 1), (timer) async {
      calculateCounter();

      final differenceInMinutes =
          widget.date.difference(DateTime.now()).inMinutes;

      if (differenceInMinutes < 1) {
        widget.refreshPuzzles?.call();
        timer.cancel();
      }
    });
    calculateCounter();
  }

  void calculateCounter() {
    if (mounted) {
      final now = DateTime.now();
      final duration = widget.date.isAfter(now)
          ? widget.date.difference(now)
          : now.difference(widget.date);
      final newTime = duration.getDurationText();
      if (newTime != counterTime) {
        setState(() {
          counterTime = newTime;
        });
      }
    }
  }

  @override
  void initState() {
    updateTime();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget.text} $counterTime',
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
