import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/partials/common/bottom_fixed_section.dart';
import 'package:vms/partials/new_appointment/date_time.dart';
import 'package:vms/partials/new_appointment/host_section.dart';
import 'package:vms/partials/new_appointment/officiality_type.dart';
import 'package:vms/partials/new_appointment/purpose_of_visit.dart';
import 'package:vms/partials/common/top.dart';
import 'package:vms/partials/new_appointment/visitor_type.dart';
import 'package:vms/views/maker/appointment_location.dart';
import 'package:vms/views/view.dart';

class NewAppointment extends StatefulWidget {
  const NewAppointment({Key? key}) : super(key: key);

  @override
  State<NewAppointment> createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopSection(
            leftText: "New Appointment",
            rightText: "Cancel",
          ),
          Divider(),
          VisitorType(),
          Divider(),
          OfficialityType(),
          Divider(),
          HostSection(
            onComplete: (value) {
              context.read<AppointmentNotifier>().addHostName(value);
            },
          ),
          Divider(),
          DateTimeSection(),
          Divider(),
          VisitPurpose(),
          BottomFixedSection(
              leftText: "Back",
              rightText: "Continue",
              fnOne: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => View()));
              },
              fnTwo: () {
                context.read<AppointmentNotifier>().showAppointment(
                    context.read<AppointmentNotifier>().appointments[0]);
                context.read<AppointmentNotifier>().newAppointmentValid();
                if (context
                    .read<AppointmentNotifier>()
                    .allNewAppointmentErrors
                    .isEmpty) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AppointmentLocation(),
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
