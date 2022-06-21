import 'package:flutter/material.dart';
import 'package:vms/models/Room.dart';
import 'package:vms/partials/appointment_location/location.dart';
import 'package:vms/partials/appointment_location/roomlist.dart';
import 'package:vms/partials/common/bottom_fixed_section.dart';
import 'package:vms/partials/common/top.dart';

import 'partials/appointment_location/floor.dart';

class AppointmentLocation extends StatefulWidget {
  const AppointmentLocation({Key? key}) : super(key: key);

  @override
  State<AppointmentLocation> createState() => _AppointmentLocationState();
}

class _AppointmentLocationState extends State<AppointmentLocation> {
  List<Room> roomlist = [
    new Room(checked: true, name: "Meeting Room 1", isAvailable: false),
    new Room(checked: true, name: "Meeting Room 2", isAvailable: false),
    new Room(checked: false, name: "Meeting Room 3", isAvailable: true),
    new Room(checked: true, name: "Meeting Room 4", isAvailable: false),
    new Room(checked: false, name: "Meeting Room 6", isAvailable: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: ListView(
        children: [
          TopSection(leftText: "Select Location", rightText: "Cancel"),
          Divider(),
          Location(
            labelText: "Location",
            listItems: ["24, Adelarin Bonojo", "Marina Estate"],
          ),
          Floor(
            labelText: "Floor",
            listItems: ["Floor 1", "Floor 2", "Floor 3", "Floor 4", "Floor 5"],
          ),
          Divider(),
          RoomsList(roomslist: roomlist),
          Divider(),
          BottomFixedSection(leftText: "Back", rightText: "Continue")
        ],
      ),
    );
  }
}
