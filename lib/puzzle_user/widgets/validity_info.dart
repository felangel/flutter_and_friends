import 'package:flutter/material.dart';

class ValidityInfo extends StatelessWidget {
  const ValidityInfo({
    required this.validationMessage,
    required this.valid,
    super.key,
  });

  final String validationMessage;
  final bool valid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          if (valid)
            const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          else
            const Icon(
              Icons.cancel_rounded,
              color: Colors.red,
            ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              validationMessage,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
