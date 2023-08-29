import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TwitterIconButton extends StatelessWidget {
  const TwitterIconButton({required this.handle, super.key});

  final String handle;

  @override
  Widget build(BuildContext context) {
    const logoSize = 16.0;
    return ClipRRect(
      borderRadius: BorderRadius.circular(logoSize * 2),
      child: ColoredBox(
        color: Colors.lightBlueAccent,
        child: IconButton(
          iconSize: logoSize * 1.25,
          // FIXME: Need to adjust the logo.
          icon: const Icon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
          ),
          onPressed: () => launchUrlString('https://twitter.com/$handle'),
        ),
      ),
    );
  }
}
