import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_input_field.dart';
import 'package:vms/notifiers/appointment_notifier.dart';

class VisitorDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(
                flex: 10,
                child: CustomInputField(
                  onComplete: (value) {
                    _appointmentNotifier.addVisitorFirstName(
                        _appointmentNotifier.appointments[0].guests[0], value);
                  },
                  bordered: false,
                  hintText: "Enter First Name",
                  labelText: "First Name",
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 10,
                child: CustomInputField(
                  onComplete: (value) {
                     _appointmentNotifier.addVisitorLastName(
                        _appointmentNotifier.appointments[0].guests[0], value);
                  },
                  bordered: false,
                  hintText: "Enter Last name",
                  labelText: "Last name",
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: CustomInputField(
            onComplete: (value) {
               _appointmentNotifier.addVisitorPhoneNumber(
                        _appointmentNotifier.appointments[0].guests[0], value);
            },
            bordered: false,
            hintText: "Enter Phone Number",
            labelText: "Phone Number",
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: CustomInputField(
            onComplete: (value) {
               _appointmentNotifier.addVisitorEmail(
                        _appointmentNotifier.appointments[0].guests[0], value);
            },
            bordered: false,
            hintText: "Enter Email",
            labelText: "Email",
          ),
        ),
      ]),
    );
  }
}
