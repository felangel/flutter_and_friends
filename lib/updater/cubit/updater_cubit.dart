import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pusher_beams/pusher_beams.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

part 'updater_state.dart';

class UpdaterCubit extends Cubit<UpdaterState> {
  UpdaterCubit({ShorebirdUpdater? updater})
      : _updater = updater ?? ShorebirdUpdater(),
        super(const UpdaterState());

  final ShorebirdUpdater _updater;

  Future<void> init() async {
    await PusherBeams.instance.start('cdd88306-52d6-4264-b082-e62fd453cf25');
    await PusherBeams.instance.addDeviceInterest('patch_available');
    await PusherBeams.instance.onMessageReceivedInTheForeground(
      (_) => checkForUpdates(),
    );
    await checkForUpdates();
  }

  Future<void> checkForUpdates() async {
    emit(state.copyWith(status: UpdaterStatus.updateCheckInProgress));
    try {
      final status = await _updater.checkForUpdate();
      final updateAvailable = status == UpdateStatus.outdated;
      emit(
        state.copyWith(
          status: UpdaterStatus.idle,
          updateAvailable: updateAvailable,
        ),
      );
      if (updateAvailable) await _downloadUpdate();
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: UpdaterStatus.idle));
    }
  }

  Future<void> _downloadUpdate() async {
    emit(state.copyWith(status: UpdaterStatus.downloadInProgress));
    try {
      await _updater.update();
      emit(
        state.copyWith(
          isNewPatchReadyToInstall: true,
          status: UpdaterStatus.idle,
        ),
      );
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(
        state.copyWith(
          isNewPatchReadyToInstall: false,
          status: UpdaterStatus.idle,
        ),
      );
    }
  }
}
