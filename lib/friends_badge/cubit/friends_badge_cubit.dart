import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:friends_badge/friends_badge.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:image/image.dart' as img;

part 'friends_badge_state.dart';

class FriendsBadgeCubit extends Cubit<FriendsBadgeState?> {
  FriendsBadgeCubit() : super(null);

  /// Resets the badge state and sets a new image.
  Future<void> updateImage(File pickedFile) async {
    final image = img.decodeImage(await pickedFile.readAsBytes());
    if (image == null) {
      emit(null);
      return;
    }
    emit(FriendsBadgeState(image: BadgeImage(image)));
  }

  void setDitherKernel(DitherKernel ditherKernel) {
    final state = this.state;
    if (state == null) return;

    emit(FriendsBadgeState(image: state.image, ditherKernel: ditherKernel));
  }

  void clearImage() {
    emit(null);
  }
}
