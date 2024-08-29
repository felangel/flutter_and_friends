import 'package:flutter/material.dart';

Future<bool?> showFuzzleWarningDialog(BuildContext context) async {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Warning'),
        content: const Text('Heads up! Please be aware that our '
            'quiz master might be quite lively,'
            ' with sound on - can be surprising especially during the event. '
            'To ensure a smooth experience, we recommend using headphones '
            'or being in a safe environment.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ],
      );
    },
  );
}
