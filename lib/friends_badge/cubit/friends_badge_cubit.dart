import 'dart:io';
import 'dart:isolate';

import 'package:equatable/equatable.dart';
import 'package:friends_badge/friends_badge.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:image/image.dart';

part 'friends_badge_state.dart';

class FriendsBadgeCubit extends Cubit<FriendsBadgeState> {
  FriendsBadgeCubit() : super(const FriendsBadgeState());

  Future<void> updateImage(File file) async {
    emit(state.copyWith(status: FriendsBadgeStatus.loading));

    try {
      final image = await Isolate.run<Image?>(
        () async => decodeImage(await file.readAsBytes()),
      );

      if (image == null) {
        return emit(state.copyWith(status: FriendsBadgeStatus.failed));
      }

      emit(
        FriendsBadgeState(
          badge: FriendsBadge(image: BadgeImage(image)),
          status: FriendsBadgeStatus.loaded,
        ),
      );
    } on Exception {
      return emit(state.copyWith(status: FriendsBadgeStatus.failed));
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
