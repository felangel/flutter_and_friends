import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:friends_badge/friends_badge.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:image/image.dart';

part 'friends_badge_state.dart';

class FriendsBadgeCubit extends Cubit<FriendsBadgeState> {
  FriendsBadgeCubit() : super(const FriendsBadgeState());

  Future<void> updateImage(File file) async {
    try {
      final image = decodeImage(await file.readAsBytes());
      if (image == null) return;
      emit(FriendsBadgeState(badge: FriendsBadge(image: BadgeImage(image))));
    } on Exception {
      return;
    }
  }

  void updateDitherKernel(DitherKernel ditherKernel) {
    emit(
      FriendsBadgeState(
        badge: state.badge?.copyWith(ditherKernel: ditherKernel),
      ),
    );
  }
}
