import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vms/custom_widgets/custom_appointment_day_date.dart';
import 'package:vms/custom_widgets/custom_appointment_list_item.dart';
import 'package:vms/helperfunctions/custom_date_formatter.dart';
import 'package:vms/helperfunctions/custom_string_manipulations.dart';
import 'package:vms/models/api_response.dart';
import 'package:vms/models/appointment.dart';
import 'package:vms/services/appointment_service.dart';

class AppointmentList extends StatefulWidget {
  List<Appointment> appointmentList;

  AppointmentList({Key? key, required this.appointmentList}) : super(key: key);

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        ...widget.appointmentList.map((appointment) {
          return AppointmentListItem(
            appointmentId: appointment.id,
            startTime:
                CustomDateFormatter.getFormattedTime(appointment.startTime),
            endTime: CustomDateFormatter.getFormattedTime(appointment.endTime),
            appointmentType: appointment.appointmentType,
            visitorName: appointment.guests.length > 1
                ? appointment.guests.toList().length.toString() + " visitors"
                : appointment.guests.length == 0
                    ? ""
                    : CustomStringManipulation.getFullName(
                        appointment.guests[0]["firstName"],
                        appointment.guests[0]["lastName"]),
            isGroupVisit: appointment.guests.length > 1 ? true : false,
          );
        }).toList()
      ]),
    );
  }
}
