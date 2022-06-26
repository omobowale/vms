import 'package:flutter/material.dart';
import 'package:vms/views/maker/visitor_information.dart';
import 'package:vms/models/Room.dart';
import 'package:vms/partials/appointment_location/floor.dart';
import 'package:vms/views/maker/new_appointment.dart';
import 'package:vms/partials/appointment_location/location.dart';
import 'package:vms/partials/appointment_location/roomlist.dart';
import 'package:vms/partials/common/bottom_fixed_section.dart';
import 'package:vms/partials/common/top.dart';

class AppointmentLocation extends StatefulWidget {
  const AppointmentLocation({Key? key}) : super(key: key);

  @override
  State<AppointmentLocation> createState() => _AppointmentLocationState();
}

class _AppointmentLocationState extends State<AppointmentLocation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopSection(leftText: "Select Location", rightText: "Cancel"),
          Divider(),
          Location(
            labelText: "Location",
          ),
          Floor(
            labelText: "Floor",
          ),
          Divider(),
          RoomsList(),
          Divider(),
          BottomFixedSection(
            leftText: "Back",
            rightText: "Continue",
            fnOne: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NewAppointment()));
            },
            fnTwo: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => VisitorInformation()));
            },
          )
        ],
      ),
    );
  }
}
