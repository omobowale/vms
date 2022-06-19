import 'package:flutter/material.dart';

class AppointmentDayDate extends StatelessWidget {
  final String dayName;
  final String date;
  const AppointmentDayDate(
      {Key? key, required this.dayName, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text(
            this.dayName.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          child: Text(this.date),
        ),
      ]),
    );
  }
}
