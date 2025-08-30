part of 'friends_badge_cubit.dart';

enum FriendsBadgeStatus {
  idle,
  loading,
  loaded,
  failed,
}

class FriendsBadgeState extends Equatable {
  const FriendsBadgeState({this.badge, this.status = FriendsBadgeStatus.idle});

  final FriendsBadge? badge;
  final FriendsBadgeStatus status;

  FriendsBadgeState copyWith({
    FriendsBadge? badge,
    FriendsBadgeStatus? status,
  }) {
    return FriendsBadgeState(
      badge: badge ?? this.badge,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [badge, status];
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
