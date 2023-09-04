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
      child: XIcon(
        iconSize: logoSize * 1.25,
        onPressed: () => launchUrlString('https://twitter.com/$handle'),
      ),
    );
  }
}

class TwitterIcon extends StatelessWidget {
  const TwitterIcon({
    required this.onPressed,
    required this.iconSize,
    super.key,
  });

  final VoidCallback onPressed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.lightBlueAccent,
      child: IconButton(
        iconSize: iconSize,
        icon: const Icon(
          FontAwesomeIcons.twitter,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class XIcon extends StatelessWidget {
  const XIcon({
    required this.onPressed,
    required this.iconSize,
    super.key,
  });

  final VoidCallback onPressed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: IconButton(
        iconSize: iconSize,
        icon: const Icon(
          FontAwesomeIcons.xTwitter,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
