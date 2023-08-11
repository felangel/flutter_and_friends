class Speaker {
  const Speaker({
    required this.name,
    required this.title,
    required this.avatar,
    this.twitter,
  });

  final String name;
  final String title;
  final String avatar;
  final String? twitter;
}
