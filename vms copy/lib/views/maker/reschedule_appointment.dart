import 'package:flutter/material.dart';
import 'package:vms/custom_widgets/custom_info_display.dart';
import 'package:vms/partials/common/bottom_fixed_section.dart';
import 'package:vms/partials/common/top_swap.dart';
import 'package:vms/partials/new_appointment/date_time.dart';
import 'package:vms/partials/new_appointment/host_section.dart';
import 'package:vms/partials/new_appointment/purpose_of_reschedule.dart';
import 'package:vms/partials/new_appointment/purpose_of_visit.dart';
import 'package:vms/partials/common/top.dart';
import 'package:vms/partials/new_appointment/visitor_type.dart';
import 'package:vms/views/maker/appointment_location.dart';
import 'package:vms/views/maker/appointment_updated_success.dart';
import 'package:vms/views/view.dart';

class RescheduleAppointment extends StatefulWidget {
  const RescheduleAppointment({Key? key}) : super(key: key);

  @override
  State<RescheduleAppointment> createState() => _RescheduleAppointmentState();
}

class _RescheduleAppointmentState extends State<RescheduleAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TopSwapSection(
                  leftText: "Cancel",
                  rightText: "Reschedule Appointment",
                  fnOne: () {
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ReschedulePurpose(),
                ),
                Divider(),
                DateTimeSection(),
                Divider(),
              ],
            ),
            BottomFixedSection(
              leftText: "Back",
              rightText: "Continue",
              fnOne: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => View()));
              },
              fnTwo: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AppointmentUpdatedSuccess()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
