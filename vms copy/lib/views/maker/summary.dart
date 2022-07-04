import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vms/models/api_response.dart';
import 'package:vms/models/appointment.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/partials/common/bottom_fixed_section.dart';
import 'package:vms/partials/common/top.dart';
import 'package:vms/partials/summary/add_another_link.dart';
import 'package:vms/services/appointment_service.dart';
import 'package:vms/views/commons/details_summary_appointment.dart';
import 'package:vms/views/commons/details_summary_assets.dart';
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
  AppointmentService get service => GetIt.I<AppointmentService>();
  late APIResponse<Appointment> appointment;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appointment = APIResponse<Appointment>(data: null, error: false);
  }

  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context);
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
          DetailsSummaryGuests(),
          Divider(),
          DetailsSummaryAssets(),
          Divider(),
          AddAnotherLink(),
          BottomFixedSection(
              leftText: "Back",
              rightText: "Submit",
              fnOne: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VisitorInformation()));
              },
              fnTwo: () async {
                var newAppointment = _appointmentNotifier.appointments[0];
                var response = await service.createAppointment(newAppointment);

                var text = (response.error != null)
                    ? (response.errorMessage ?? "An error occured")
                    : "Appointment created";
                print("text :::::: " + text);

                // final x = json.encode(newAppointment.toJson(),
                //     toEncodable: newAppointment.myEncode);
                // print(x);

                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => AppointmentCreationSuccess()));
              }),
        ],
      ),
    );
  }
}
