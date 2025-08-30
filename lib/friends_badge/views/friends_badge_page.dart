import 'package:flutter/material.dart';
import 'package:flutter_and_friends/friends_badge/friends_badge.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friends_badge/friends_badge.dart';

class FriendsBadgePage extends StatelessWidget {
  const FriendsBadgePage({super.key});

  static Route<void> route() => MaterialPageRoute(
    builder: (_) => const FriendsBadgePage(),
  );

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => FriendsBadgeCubit(),
    child: const FriendsBadgeView(),
  );
}

class FriendsBadgeView extends StatelessWidget {
  const FriendsBadgeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final badge = context.watch<FriendsBadgeCubit>().state.badge;
    final body = badge == null
        ? Center(
            child: Text(
              'Pick an image to get started',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium,
            ),
          )
        : _BadgeEditor(badge: badge);

    return Scaffold(
      appBar: AppBar(title: const Text('Friends Badge')),
      floatingActionButton: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (badge != null) WriteToBadgeButton(badge),
          const PickImageButton(),
        ],
      ),
      body: body,
    );
  }
}

class _BadgeEditor extends StatelessWidget {
  const _BadgeEditor({required this.badge});

  final FriendsBadge badge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 16,
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 1 / 6,
                    child: Center(
                      child: _BadgeDitherKernelCarousel(badge: badge),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxHeight * 4 / 6,
                    ),
                    child: Center(child: _BadgePreview(badge: badge)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BadgePreview extends StatelessWidget {
  const _BadgePreview({required this.badge});

  final FriendsBadge badge;

  @override
  Widget build(BuildContext context) {
    return Image.memory(badge.image.getImageBytes(badge.ditherKernel));
  }
}

class _BadgeDitherKernelCarousel extends StatelessWidget {
  const _BadgeDitherKernelCarousel({required this.badge});

  final FriendsBadge badge;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: BadgeImage.allSupportedKernels.length,
      separatorBuilder: (context, index) => const SizedBox(width: 8),
      itemBuilder: (context, index) {
        final kernel = [...BadgeImage.allSupportedKernels.reversed][index];
        final decoration = kernel == badge.ditherKernel
            ? BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.4),
                border: Border.all(width: 3),
              )
            : const BoxDecoration();
        return DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: decoration,
          child: InkWell(
            onTap: () {
              context.read<FriendsBadgeCubit>().updateDitherKernel(kernel);
            },
            child: Image.memory(badge.image.getPeekImageBytes(kernel)),
          ),
        );
      },
    );
  }
}
