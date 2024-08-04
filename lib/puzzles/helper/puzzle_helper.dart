import 'dart:math';

enum AudioType { home, input, match, singleChoice, complete, congrats }

class PuzzleHelper {
  static String getRandomAudio(AudioType audioType) {
    final randomInt = Random().nextInt(3) + 1;

    switch (audioType) {
      case AudioType.congrats:
        return 'audio/congratulations.mp3';
      case AudioType.home:
        return 'audio/intro.mp3';
      case AudioType.input:
        return 'audio/type_$randomInt.mp3';
      case AudioType.match:
        return 'audio/match_$randomInt.mp3';
      case AudioType.singleChoice:
        return 'audio/choice_$randomInt.mp3';
      case AudioType.complete:
        return 'audio/well_done_$randomInt.mp3';
    }
  }
}
