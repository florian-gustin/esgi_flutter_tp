class Activity {
  final String title;
  bool isSelected;

  Activity({required this.title, this.isSelected = false});

  void toggle() {
    isSelected = !isSelected;
  }
}