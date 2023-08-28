part of 'settings_cubit.dart';

final class SettingsState extends Equatable {
  const SettingsState({
    required this.version,
    this.patchNumber,
  });

  final Version version;
  final int? patchNumber;

  SettingsState copyWith({
    Version? version,
    int? patchNumber,
  }) {
    return SettingsState(
      version: version ?? this.version,
      patchNumber: patchNumber ?? this.patchNumber,
    );
  }

  @override
  List<Object?> get props => [version, patchNumber];
}
