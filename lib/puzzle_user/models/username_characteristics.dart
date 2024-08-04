enum UsernameCharacteristics {
  startsWithAlphabet(
    'The username must start with an alphabetic character.',
  ),
  containsAtLeastTwoLetters(
    'The username should contain at least two letters.',
  ),
  isAlphanumeric(
    'The username can only include alphabets and numbers.',
  );

  const UsernameCharacteristics(this.message);
  final String message;
}
