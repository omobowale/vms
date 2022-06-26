import 'package:flutter/material.dart';
import 'package:vms/partials/common/bottom_fixed_section.dart';
import 'package:vms/partials/common/top.dart';
import 'package:vms/partials/summary/add_another_link.dart';
import 'package:vms/views/commons/details_summary_appointment.dart';
import 'package:vms/views/commons/details_summary_guests.dart';
import 'package:vms/views/commons/details_summary_location.dart';
import 'package:vms/views/maker/visitor_information.dart';
import 'package:vms/views/maker/appointment_creation_success.dart';

class Summary extends StatefulWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopSection(
            leftText: "Summary",
            rightText: "Cancel",
          ),
          Divider(),
          DetailsSummaryAppointment(
            isSummary: true,
          ),
          Divider(),
          DetailsSummaryLocation(),
          Divider(),
          DetailsSummaryGuests(guestsList: []),
          Divider(),
          AddAnotherLink(),
          BottomFixedSection(
              leftText: "Back",
              rightText: "Submit",
              fnOne: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VisitorInformation()));
              },
              fnTwo: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AppointmentCreationSuccess()));
              }),
        ],
      ),
    );
  }
}
