import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_info_display.dart';
import 'package:vms/models/api_response.dart';
import 'package:vms/models/appointment.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/partials/common/bottom_fixed_section.dart';
import 'package:vms/partials/common/confirmation_modal.dart';
import 'package:vms/partials/common/top.dart';
import 'package:vms/partials/summary/add_another_link.dart';
import 'package:vms/services/appointment_service.dart';
import 'package:vms/views/commons/details_summary_appointment.dart';
import 'package:vms/views/commons/details_summary_guests.dart';
import 'package:vms/views/commons/details_summary_location.dart';
import 'package:vms/views/maker/visitor_information.dart';
import 'package:vms/views/maker/appointment_creation_success.dart';
import 'package:vms/views/view.dart';

class Summary extends StatefulWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  AppointmentService get service => GetIt.I<AppointmentService>();
  late APIResponse<Appointment> appointment;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appointment = APIResponse<Appointment>(data: null, error: false);
    isLoading = false;
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
          AddAnotherLink(),
          BottomFixedSection(
              leftText: "Back",
              rightText: "Submit",
              fnOne: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VisitorInformation()));
              },
              fnTwo: () {
                showModalBottomSheet<void>(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmationModal(
                        confirmationTextTitle: "Are you sure?",
                        confirmationTextDescription:
                            "You are about to submit this appointment, you will not be able to modify it again",
                        acceptFunction: () async {
                          print("yes");
                          var newAppointment =
                              _appointmentNotifier.appointments[0];
                          var response =
                              await service.createAppointment(newAppointment);

                          Navigator.of(context).pop();

                          if (response.error != null ||
                              response.errorMessage != null) {
                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    actions: [],
                                    title: Text(
                                      "Error",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                    content: response.error != null
                                        ? Text(
                                            "Could not create appointment. Please try again!",
                                          )
                                        : Text(
                                            response.errorMessage ??
                                                "Could not create appointment. Please try again!",
                                          ),
                                  );
                                });
                          } else {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AppointmentCreationSuccess()),
                                (Route<dynamic> route) => false);
                          }
                          // }
                        },
                        declineFunction: () {
                          Navigator.of(context).pop();
                        },
                      );
                    });
              }),
        ],
      ),
    );
  }
}
