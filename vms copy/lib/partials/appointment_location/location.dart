import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';
import 'package:vms/custom_widgets/custom_error_label.dart';
import 'package:vms/custom_widgets/custom_input_label.dart';
import 'package:vms/data/locations.dart';
import 'package:vms/notifiers/appointment_notifier.dart';

class Location extends StatelessWidget {
  final String labelText;

  const Location({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputLabel(labelText: "Location"),
          CustomErrorLabel(
              errorText: context
                  .read<AppointmentNotifier>()
                  .allLocationErrors["location"]),
          CustomDropDown(
            text: context.read<AppointmentNotifier>().appointments[0].location,
            onTap: (value) {
              context.read<AppointmentNotifier>().addLocation(value);
            },
            lists: locations.toSet(),
          ),
        ],
      ),
    );
  }
}
