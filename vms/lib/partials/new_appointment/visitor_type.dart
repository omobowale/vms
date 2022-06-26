import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_radio_button.dart';
import 'package:vms/notifiers/appointment_notifier.dart';

class VisitorType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Visitor Type",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          CustomRadioButton(
            isClicked: (value) {
              context.read<AppointmentNotifier>().addVisitorType(value);
            },
            checkText: context
                .read<AppointmentNotifier>()
                .appointments[0]
                .appointmentType,
            labelText: "Regular",
            checked: true,
            isAvailable: true,
          ),
          CustomRadioButton(
            checkText: context
                .read<AppointmentNotifier>()
                .appointments[0]
                .appointmentType,
            isClicked: (value) {
              context.read<AppointmentNotifier>().addVisitorType(value);
            },
            labelText: "VVIP",
            checked: false,
            isAvailable: true,
          ),
        ],
      ),
    );
  }
}
