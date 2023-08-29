import 'package:flutter/material.dart';
import 'package:flutter_and_friends/schedule/schedule.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({required this.location, super.key});

  final Location location;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 18,
          color: theme.colorScheme.secondary,
        ),
        InkWell(
          onTap: () {
            final url =
                'http://maps.google.com/?q=${location.coordinates.$1},${location.coordinates.$2}';
            launchUrlString(url);
          },
          child: Text(
            location.name,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
