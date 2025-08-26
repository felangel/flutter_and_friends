import 'package:flutter/material.dart';
import 'package:flutter_and_friends/friends_badge/friends_badge.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friends_badge/friends_badge.dart';

class FriendsBadgePage extends StatelessWidget {
  const FriendsBadgePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const FriendsBadgePage());
  }

  @override
  Widget build(BuildContext context) => const FavoritesView();
}

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update your Friends Badge')),
      floatingActionButton: const PickImageButton(),
      body: BlocBuilder<FriendsBadgeCubit, FriendsBadgeState?>(
        builder: (context, state) {
          if (state == null) {
            return const Center(child: Text('Pick an image to get started'));
          }
          return BadgeTemplateEditor(state: state);
        },
      ),
    );
  }
}

class BadgeTemplateEditor extends StatelessWidget {
  const BadgeTemplateEditor({required this.state, super.key});

  final FriendsBadgeState state;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _PreviewImage(state),
        const SizedBox(height: 16),
        _PeekImages(state),
      ],
    );
  }
}

class _PreviewImage extends StatefulWidget {
  const _PreviewImage(this.state);

  final FriendsBadgeState state;

  @override
  State<_PreviewImage> createState() => _PreviewImageState();
}

class _PreviewImageState extends State<_PreviewImage> {
  bool isRevealingUnditheredImage = false;

  @override
  Widget build(BuildContext context) {
    final previewKernel = isRevealingUnditheredImage
        ? null
        : widget.state.ditherKernel;
    return GestureDetector(
      onTapDown: (_) {
        setState(() => isRevealingUnditheredImage = true);
      },
      onTapUp: (_) {
        setState(() => isRevealingUnditheredImage = false);
      },
      onTapCancel: () {
        setState(() => isRevealingUnditheredImage = false);
      },
      child: SizedBox(
        height: 420,
        child: Stack(
          children: [
            Positioned.fill(
              bottom: null,
              child: Center(
                child: Image.memory(
                  widget.state.image.getImageBytes(previewKernel),
                  height: 400,
                ),
              ),
            ),
            if (!isRevealingUnditheredImage)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: WriteToBadgeButton(widget.state),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _PeekImages extends StatelessWidget {
  const _PeekImages(this.state);

  final FriendsBadgeState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: BadgeImage.allSupportedKernels.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final kernel = BadgeImage.allSupportedKernels[index];
          return Container(
            foregroundDecoration: kernel == state.ditherKernel
                ? BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.4),
                    border: Border.all(
                      width: 3,
                    ),
                  )
                : null,
            child: InkWell(
              onTap: () {
                context.read<FriendsBadgeCubit>().setDitherKernel(
                  kernel,
                );
              },
              child: Image.memory(
                state.image.getPeekImageBytes(kernel),
                width: 50,
              ),
            ),
          );
        },
      ),
    );
  }
}
