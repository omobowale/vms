import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';

class ReschedulePurpose extends StatefulWidget {
  const ReschedulePurpose({Key? key}) : super(key: key);

  @override
  State<ReschedulePurpose> createState() => _ReschedulePurposeState();
}

class _ReschedulePurposeState extends State<ReschedulePurpose> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: CustomDropDown(
        onTap: (_) {},
        text: "Reason for reschedule",
        lists: Set.from(['Reason 1', 'Reason 2', 'Reason 3']),
      ),
    );
  }
}
