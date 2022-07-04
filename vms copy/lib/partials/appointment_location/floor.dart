import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';
import 'package:vms/custom_widgets/custom_error_label.dart';
import 'package:vms/custom_widgets/custom_input_label.dart';
import 'package:vms/data/floors.dart';
import 'package:vms/notifiers/appointment_notifier.dart';

class Floor extends StatelessWidget {
  final String labelText;
  const Floor({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputLabel(labelText: "Floor"),
          CustomErrorLabel(
              errorText: context
                  .read<AppointmentNotifier>()
                  .allLocationErrors["floor"]),
          CustomDropDown(
            onTap: (value) {
              context.read<AppointmentNotifier>().addFloor(value);
              context.read<AppointmentNotifier>().removeError("floor");
            },
            text:
                context.read<AppointmentNotifier>().appointments[0].floorNumber,
            lists: floors.toSet(),
          ),
        ],
      ),
    );
  }
}
