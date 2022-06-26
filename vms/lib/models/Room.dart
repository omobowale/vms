class Room {
  String name;
  String id;
  final bool checked;
  final bool isAvailable;

  Room(
      {required this.name,
      required this.id,
      required this.checked,
      required this.isAvailable});

  @override
  String toString() {
    // TODO: implement toString
    return "[name: ${this.name}, id: ${this.id}, checked: ${this.checked}, available: ${this.isAvailable}]";
  }
}
