import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TwitterIconButton extends StatelessWidget {
  const TwitterIconButton({required this.handle, super.key});

  final String handle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => launchUrlString('https://twitter.com/$handle'),
      child: Text('@$handle'),
    );
  }
}
