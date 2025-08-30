import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_and_friends/friends_badge/friends_badge.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PickImageButton extends StatelessWidget {
  const PickImageButton({super.key});

  Future<void> pickImage(BuildContext context) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile == null || !context.mounted) return;
    await context.read<FriendsBadgeCubit>().updateImage(
      File(pickedFile.path),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'PickImageButton',
      tooltip: 'Pick an image from gallery',
      onPressed: () => pickImage(context),
      child: const Icon(Icons.image_search),
    );
  }
}
