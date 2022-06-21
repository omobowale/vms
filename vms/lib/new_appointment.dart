import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vms/partials/common/bottom_fixed_section.dart';
import 'package:vms/partials/new_appointment/date_time.dart';
import 'package:vms/partials/new_appointment/host_section.dart';
import 'package:vms/partials/new_appointment/purpose_of_visit.dart';
import 'package:vms/partials/common/top.dart';
import 'package:vms/partials/new_appointment/visitor_type.dart';

class NewAppointment extends StatefulWidget {
  const NewAppointment({Key? key}) : super(key: key);

  @override
  State<NewAppointment> createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          TopSection(
            leftText: "New Appointment",
            rightText: "Cancel",
          ),
          Divider(),
          VisitorType(),
          Divider(),
          HostSection(),
          Divider(),
          DateTimeSection(),
          Divider(),
          VisitPurpose(),
          BottomFixedSection(
            leftText: "Back",
            rightText: "Continue",
          ),
        ],
      ),
    );
  }
}
