import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';
import 'package:vms/custom_widgets/custom_error_label.dart';
import 'package:vms/custom_widgets/custom_input_label.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/notifiers/group_heads_notifier.dart';
import 'package:vms/notifiers/purpose_notifier.dart';

class GroupHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context, listen: true);
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputLabel(labelText: "Group Head"),
          CustomErrorLabel(
              errorText:
                  _appointmentNotifier.allNewAppointmentErrors["groupHead"]),
          CustomDropDown(
            onTap: (value) {
              print(value);
              context.read<AppointmentNotifier>().addGroupHead(value);
              context.read<AppointmentNotifier>().removeError("groupHead");
            },
            text: context
                .read<AppointmentNotifier>()
                .appointments[0]
                .groupHead
                .fullName,
            lists: context.read<GroupHeadsNotifier>().allGroupHeads.toSet(),
          ),
        ],
      ),
    );
  }
}
