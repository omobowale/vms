import 'package:flutter/material.dart';
import 'package:vms/custom_widgets/custom_appointment_day_date.dart';
import 'package:vms/custom_widgets/custom_appointment_list_item.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        AppointmentDayDate(
          date: "12/07/22",
          dayName: "Sunday",
        ),
        AppointmentListItem(
          dateTime: "9:00 AM - 12:00 PM",
          appointmentType: "Personal",
          visitorName: "Peter Abu-Ekpeshie",
          isGroupVisit: false,
        ),
        AppointmentListItem(
          dateTime: "11:00 AM - 1:30 PM",
          appointmentType: "Official",
          visitorName: "5 visitors",
          isGroupVisit: true,
        ),
      ]),
    );
  }
}
