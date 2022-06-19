import 'package:flutter/material.dart';
import 'package:vms/custom_widgets/calendar_strip.dart';
import 'package:vms/custom_widgets/no_appointment.dart';
import 'package:vms/partials/view/appointment_list.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarStrip(),
          AppointmentList(),
          NoAppointment(
            date: "13/07/22",
            dayName: "Monday",
          ),
          NoAppointment(
            date: "14/07/22",
            dayName: "Tuesday",
          ),
          NoAppointment(
            date: "15/07/22",
            dayName: "Wednesday",
          ),
          NoAppointment(
            date: "16/07/22",
            dayName: "Thursday",
          ),
        ],
      ),
    );
  }
}
