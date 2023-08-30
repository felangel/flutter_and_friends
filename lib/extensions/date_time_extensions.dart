import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String prettyPrint(BuildContext context, Duration duration) {
    return '''${DateFormat.MMMMd().format(this)}, ${TimeOfDay.fromDateTime(this).format(context)} - ${TimeOfDay.fromDateTime(add(duration)).format(context)}''';
  }
}
