import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_error_label.dart';
import 'package:vms/custom_widgets/custom_radio_button.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/notifiers/officiality_types_notifier.dart';
import 'package:vms/notifiers/visitor_types_notifier.dart';

class OfficialityType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context, listen: true);
    OfficialityTypeNotifier _officialityTypeNotifier =
        Provider.of<OfficialityTypeNotifier>(context, listen: true);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Officiality Type",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          CustomErrorLabel(
              errorText:
                  _appointmentNotifier.allNewAppointmentErrors["officiality"]),
          ..._officialityTypeNotifier.allOfficialityTypes
              .map((e) => CustomRadioButton(
                  isClicked: (value) {
                    _appointmentNotifier.addOfficialityType(value);
                    _appointmentNotifier.removeError("officiality");
                  },
                  checkText: _appointmentNotifier.appointments[0].officiality,
                  labelText: e.type,
                  isAvailable: true))
              .toList(),
        ],
      ),
    );
  }
}
