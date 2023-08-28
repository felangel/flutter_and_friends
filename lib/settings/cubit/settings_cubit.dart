import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_and_friends/config/config.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:shorebird_code_push/shorebird_code_push_io.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({ShorebirdCodePush? codePush})
      : _codePush = codePush ?? ShorebirdCodePush(),
        super(SettingsState(version: version));

  final ShorebirdCodePush _codePush;

  Future<void> init() async {
    final patchNumber = await _codePush.currentPatchNumber();
    emit(state.copyWith(patchNumber: patchNumber));
  }
}
