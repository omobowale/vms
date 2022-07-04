import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_error_label.dart';
import 'package:vms/custom_widgets/custom_input_field.dart';
import 'package:vms/custom_widgets/custom_input_label.dart';
import 'package:vms/notifiers/appointment_notifier.dart';

class HostSection extends StatefulWidget {
  final Function onComplete;
  const HostSection({Key? key, required this.onComplete}) : super(key: key);

  @override
  State<HostSection> createState() => _HostSectionState();
}

class _HostSectionState extends State<HostSection> {
  @override
  Widget build(BuildContext context) {
    String staffName =
        context.watch<AppointmentNotifier>().appointments[0].staffName;
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputLabel(labelText: "Host name"),
          CustomErrorLabel(
            errorText: _appointmentNotifier.allNewAppointmentErrors["staffName"],
          ),
          CustomInputField(
            initialValue: staffName,
            hintText:
                staffName != null && staffName != "" ? staffName : "Host name",
            labelText: staffName,
            bordered: false,
            onComplete: (value) async {
              await widget.onComplete(value);
              print("staff name ==> : " +
                  _appointmentNotifier.appointments[0].staffName);
              if (_appointmentNotifier.appointments[0].staffName != "") {
                _appointmentNotifier.removeError("staffName");
              }
            },
          ),
        ],
      ),
    );
  }
}
