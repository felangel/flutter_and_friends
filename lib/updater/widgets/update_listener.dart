import 'package:flutter/material.dart';
import 'package:flutter_and_friends/updater/updater.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_app/restart_app.dart';

class UpdateListener extends StatelessWidget {
  const UpdateListener({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UpdaterCubit, UpdaterState>(
          listenWhen: (previous, current) =>
              previous.status == UpdaterStatus.downloadInProgress &&
              current.status == UpdaterStatus.idle &&
              current.isNewPatchReadyToInstall,
          listener: (context, state) {
            ScaffoldMessenger.of(context)
              ..hideCurrentMaterialBanner()
              ..showMaterialBanner(
                const MaterialBanner(
                  content: Text('A new patch is ready!'),
                  actions: [
                    TextButton(
                      onPressed: Restart.restartApp,
                      child: Text('Restart app'),
                    ),
                  ],
                ),
              );
          },
        ),
        BlocListener<UpdaterCubit, UpdaterState>(
          listenWhen: (previous, current) =>
              previous.status == UpdaterStatus.updateCheckInProgress &&
              current.status == UpdaterStatus.idle &&
              current.updateAvailable,
          listener: (context, state) {
            ScaffoldMessenger.of(context)
              ..hideCurrentMaterialBanner()
              ..showMaterialBanner(
                MaterialBanner(
                  content: const Text('Update available'),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentMaterialBanner()
                          ..showMaterialBanner(
                            const MaterialBanner(
                              content: Text('Downloading...'),
                              actions: [
                                SizedBox(
                                  height: 14,
                                  width: 14,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              ],
                            ),
                          );
                        await context.read<UpdaterCubit>().downloadUpdate();
                      },
                      child: const Text('Download'),
                    ),
                  ],
                ),
              );
          },
        ),
      ],
      child: child,
    );
  }
}
