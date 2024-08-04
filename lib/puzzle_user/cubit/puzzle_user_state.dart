part of 'puzzle_user_cubit.dart';

class PuzzleUserState extends Equatable {
  const PuzzleUserState({required this.username});

  const PuzzleUserState.initial() : username = '';

  final String username;

  @override
  List<Object?> get props => [username];

  // Getter to check if username starts with an alphabet
  bool get startsWithAlphabet {
    final regex = RegExp('^[a-zA-Z]');
    return regex.hasMatch(username);
  }

  // Getter to check if username contains at least two letters
  bool get containsAtLeastTwoLetters {
    final regex = RegExp('([a-zA-Z].*[a-zA-Z])');
    return regex.hasMatch(username);
  }

  // Getter to check if username only contains alphabets and numbers
  bool get isAlphanumeric {
    final regex = RegExp(r'^[a-zA-Z0-9]+$');
    return regex.hasMatch(username);
  }

  // Getter to check if username is valid
  bool get isUsernameValid {
    return startsWithAlphabet && containsAtLeastTwoLetters && isAlphanumeric;
  }
}
