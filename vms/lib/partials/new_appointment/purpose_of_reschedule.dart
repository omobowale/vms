import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';
import 'package:vms/custom_widgets/custom_error_label.dart';
import 'package:vms/notifiers/appointment_notifier.dart';

class ReschedulePurpose extends StatefulWidget {
  const ReschedulePurpose({Key? key}) : super(key: key);

  @override
  State<ReschedulePurpose> createState() => _ReschedulePurposeState();
}

class _ReschedulePurposeState extends State<ReschedulePurpose> {
  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context);
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          CustomErrorLabel(
              errorText: _appointmentNotifier
                  .allNewAppointmentErrors["purposeOfReschedule"]),
          CustomDropDown(
            onTap: (value) {
              _appointmentNotifier.removeError("purposeOfReschedule");
              _appointmentNotifier.addPurposeOfReschedule(value);
            },
            text: "Reason 1",
            lists: ['Reason 1', 'Reason 2', 'Reason 3'].toSet(),
          ),
        ],
      ),
    );
  }
}
