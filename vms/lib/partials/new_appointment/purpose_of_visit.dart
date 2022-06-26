import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';
import 'package:vms/custom_widgets/custom_input_label.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/notifiers/purpose_notifier.dart';

class VisitPurpose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputLabel(labelText: "Purpose of visit"),
          CustomDropDown(
            onTap: (value) {
              print(value);
              context.read<AppointmentNotifier>().addVisitPurpose(value);
            },
            text: context
                .read<AppointmentNotifier>()
                .appointments[0]
                .visitPurpose,
            lists: context.read<PurposeNotifier>().purposes.toSet(),
          ),
        ],
      ),
    );
  }
}
