import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_and_friends/config/config.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:shorebird_code_push/shorebird_code_push_io.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required ShorebirdCodePush codePush})
      : _codePush = codePush,
        super(SettingsState(version: version));

  final ShorebirdCodePush _codePush;

  Future<void> init() async {
    final patchNumber = await _codePush.currentPatchNumber();
    emit(state.copyWith(patchNumber: patchNumber));
  }

  Future<void> checkForUpdates() async {
    emit(state.copyWith(status: SettingsStatus.updateCheckInProgress));
    try {
      final updateAvailable = await _codePush.isNewPatchAvailableForDownload();
      emit(
        state.copyWith(
          status: SettingsStatus.idle,
          updateAvailable: updateAvailable,
        ),
      );
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: SettingsStatus.idle));
    }
  }

  Future<void> downloadUpdate() async {
    emit(state.copyWith(status: SettingsStatus.downloadInProgress));
    try {
      await _codePush.downloadUpdateIfAvailable();
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    } finally {
      emit(state.copyWith(status: SettingsStatus.idle));
    }
  }
}
