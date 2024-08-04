import 'dart:ui';

class MatchItem {
  MatchItem({
    required this.text,
    this.color,
    this.selected = false,
    this.valueIndex,
  });

  String text;
  bool selected;
  Color? color;
  int? valueIndex;

  void unselect() {
    color = null;
    selected = false;
    valueIndex = null;
  }
}
