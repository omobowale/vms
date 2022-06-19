import 'package:flutter/material.dart';
import 'package:vms/custom_widgets/calendar_strip.dart';
import 'package:vms/partials/view/appointment_list.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarStrip(),
          AppointmentList(),
        ],
      ),
    );
  }
}
