part of 'friends_badge_cubit.dart';

class FriendsBadgeState extends Equatable {
  const FriendsBadgeState({this.badge});

  final FriendsBadge? badge;

  @override
  List<Object?> get props => [badge];
}

class FriendsBadge extends Equatable {
  const FriendsBadge({
    required this.image,
    this.ditherKernel = DitherKernel.atkinson,
  });

  final BadgeImage image;
  final DitherKernel ditherKernel;

  FriendsBadge copyWith({BadgeImage? image, DitherKernel? ditherKernel}) {
    return FriendsBadge(
      image: image ?? this.image,
      ditherKernel: ditherKernel ?? this.ditherKernel,
    );
  }

  @override
  List<Object> get props => [image, ditherKernel];
}
