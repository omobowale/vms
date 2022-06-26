import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_input_field.dart';
import 'package:vms/notifiers/appointment_notifier.dart';

class VisitorAddress extends StatelessWidget {
  const VisitorAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Column(
        children: [
          CustomInputField(
            onComplete: (value) {
              _appointmentNotifier.addVisitorAddress(
                  _appointmentNotifier.appointments[0].guests[0], value);
            },
            bordered: false,
            hintText: "Enter visitor address",
            labelText: "Visitor address",
            minLines: 3,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
