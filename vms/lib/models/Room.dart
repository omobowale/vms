class Room {
  String name;
  final bool checked;
  final bool isAvailable;

  Room({required this.name, required this.checked, required this.isAvailable});

  set setName(String name) {
    this.name = name;
  }
}
