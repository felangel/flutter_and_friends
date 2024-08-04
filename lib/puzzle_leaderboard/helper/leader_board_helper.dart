class LeaderBoardHelper {
  static String getRankEmoji(int position) {
    return switch (position) {
      1 => '🏆',
      2 => '🥈',
      3 => '🥉',
      _ => '$position'
    };
  }
}
