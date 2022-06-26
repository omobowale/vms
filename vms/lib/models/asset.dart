class Asset {
  String name;
  String id;

  Asset({
    required this.name,
    required this.id,
  });

  @override
  String toString() {
    return "[name: ${this.name}, id: ${this.id}]";
  }
}
