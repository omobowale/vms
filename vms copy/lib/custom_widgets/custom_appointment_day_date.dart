import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/helperfunctions/custom_date_formatter.dart';

class AppointmentDayDate extends StatelessWidget {
  final DateTime selectedDate;
  const AppointmentDayDate({Key? key, required this.selectedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text(
            CustomDateFormatter.getWeekDay(selectedDate),
            style:
                TextStyle(fontWeight: FontWeight.w500, color: Palette.FBN_BLUE),
          ),
        ),
        Container(
          child: Text(
            CustomDateFormatter.getFormatedDate(selectedDate),
          ),
        ),
      ]),
    );
  }
}
