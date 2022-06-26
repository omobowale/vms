import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_radio_button.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/notifiers/visitor_types_notifier.dart';

class VisitorType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context, listen: true);
    VisitorTypeNotifier _visitorTypeNotifier =
        Provider.of<VisitorTypeNotifier>(context, listen: true);

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
          ..._visitorTypeNotifier.allVisitorTypes
              .map((e) => CustomRadioButton(
                  isClicked: (value) {
                    _appointmentNotifier.addVisitorType(value);
                  },
                  checkText:
                      _appointmentNotifier.appointments[0].appointmentType,
                  labelText: e.type,
                  isAvailable: true))
              .toList(),
        ],
      ),
    );
  }
}
