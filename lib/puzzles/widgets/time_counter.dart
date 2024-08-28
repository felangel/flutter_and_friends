import 'dart:async';

import 'package:flutter/material.dart';

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
    super.initState();
    updateTime();
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

extension on Duration {
  String getDurationText() {
    final days = inDays;
    final hours = inHours;
    final minutes = inMinutes;
    final hoursCeil = (minutes / 60).ceil();
    final seconds = inSeconds;
    final minutesCeil = (seconds / 60).ceil();

    if (days >= 32) {
      return '';
    } else if (days >= 29) {
      return '1 month';
    } else if (days >= 8) {
      return '${(days / 7).ceil()} weeks';
    } else if (days == 7) {
      return '1 week';
    } else if (hoursCeil >= 24 && (minutes / 60) > 24) {
      return '${(hoursCeil / 24).ceil()} days';
    } else if (hoursCeil == 24) {
      return 'one day';
    } else if (hours >= 1) {
      final dMinutes = minutes - (hours * 60);
      final hPlural = hours == 1 ? 'hour' : 'hours';
      final mPlural = dMinutes == 1 ? 'minute' : 'minutes';
      final minuteText = dMinutes >= 1 ? ' and $dMinutes $mPlural' : '';
      return '$hours $hPlural$minuteText';
    } else if (minutesCeil == 60) {
      return '1 hour';
    } else if (minutesCeil >= 2) {
      return '$minutesCeil minutes';
    } else {
      return '1 minute';
    }
  }
}
