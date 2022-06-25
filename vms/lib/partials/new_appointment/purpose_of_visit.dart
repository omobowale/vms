import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';
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
      child: CustomDropDown(
        text: "Purpose of visit",
        lists: context.read<PurposeNotifier>().purposes,
      ),
    );
  }
}
