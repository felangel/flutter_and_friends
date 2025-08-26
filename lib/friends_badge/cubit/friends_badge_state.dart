part of 'friends_badge_cubit.dart';

class FriendsBadgeState extends Equatable {
  const FriendsBadgeState({
    required this.image,
    this.ditherKernel = DitherKernel.atkinson,
  });

  final BadgeImage image;
  final DitherKernel ditherKernel;

  @override
  List<Object> get props => [image, ditherKernel];
}
