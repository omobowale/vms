import 'package:flutter/cupertino.dart';
import 'package:vms/data/rooms.dart';
import 'package:vms/models/Room.dart';

class RoomsNotifier with ChangeNotifier {
  List<Room> get allrooms {
    return createRoomsFromData(rooms);
  }

  List<Room> createRoomsFromData(List<dynamic> rooms) {
    int count = 0;
    List<Room> allrooms = rooms.map((room) {
      return new Room(name: room, id: (++count).toString(), checked: false, isAvailable: true);
    }).toList();

    return allrooms;
  }
}
