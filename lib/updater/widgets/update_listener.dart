import 'package:flutter/material.dart';
import 'package:flutter_and_friends/updater/updater.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateListener extends StatelessWidget {
  const UpdateListener({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UpdaterCubit, UpdaterState>(
          listenWhen:
              (previous, current) =>
                  previous.status == UpdaterStatus.downloadInProgress &&
                  current.status == UpdaterStatus.idle &&
                  current.isNewPatchReadyToInstall,
          listener: (context, state) {
            ScaffoldMessenger.of(context)
              ..hideCurrentMaterialBanner()
              ..showMaterialBanner(
                MaterialBanner(
                  content: const Text(
                    'An update is available, please restart!',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(
                          context,
                        ).hideCurrentMaterialBanner();
                      },
                      child: const Text('Dismiss'),
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
