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

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "id": id,
      "checked": checked,
      "isAvailable": isAvailable
    };
  }

  factory Room.fromMap(Map<String, dynamic> room) {
    return new Room(
        checked: true, id: room["id"], isAvailable: true, name: room["name"]);
  }

  static List<Room> convertRoomMapsToRoomObjects(List<dynamic> rooms) {
    Iterable<Room> r = rooms.map((room) {
      if (room is Map<String, dynamic>) {
        return Room.fromMap(room);
      } else {
        return room;
      }
    });
    print("x : " + r.toString());
    return r.toList();
  }
}
