part of 'updater_cubit.dart';

enum UpdaterStatus { idle, updateCheckInProgress, downloadInProgress }

final class UpdaterState extends Equatable {
  const UpdaterState({
    this.status = UpdaterStatus.idle,
    this.updateAvailable = false,
    this.isNewPatchReadyToInstall = false,
  });

  final UpdaterStatus status;
  final bool updateAvailable;
  final bool isNewPatchReadyToInstall;

  UpdaterState copyWith({
    UpdaterStatus? status,
    bool? updateAvailable,
    bool? isNewPatchReadyToInstall,
  }) {
    return UpdaterState(
      status: status ?? this.status,
      updateAvailable: updateAvailable ?? this.updateAvailable,
      isNewPatchReadyToInstall:
          isNewPatchReadyToInstall ?? this.isNewPatchReadyToInstall,
    );
  }

  @override
  List<Object?> get props => [
        status,
        updateAvailable,
        isNewPatchReadyToInstall,
      ];
}
