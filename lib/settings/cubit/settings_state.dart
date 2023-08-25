part of 'settings_cubit.dart';

enum SettingsStatus { idle, updateCheckInProgress, downloadInProgress }

final class SettingsState extends Equatable {
  const SettingsState({
    required this.version,
    this.patchNumber,
    this.status = SettingsStatus.idle,
    this.updateAvailable = false,
  });

  final Version version;
  final int? patchNumber;
  final SettingsStatus status;
  final bool updateAvailable;

  SettingsState copyWith({
    Version? version,
    int? patchNumber,
    SettingsStatus? status,
    bool? updateAvailable,
  }) {
    return SettingsState(
      version: version ?? this.version,
      patchNumber: patchNumber ?? this.patchNumber,
      status: status ?? this.status,
      updateAvailable: updateAvailable ?? this.updateAvailable,
    );
  }

  @override
  List<Object?> get props => [version, patchNumber, status, updateAvailable];
}
