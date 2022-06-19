import 'package:flutter/material.dart';

class CalendarStrip extends StatefulWidget {
  const CalendarStrip({Key? key}) : super(key: key);

  @override
  State<CalendarStrip> createState() => _CalendarStripState();
}

class _CalendarStripState extends State<CalendarStrip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Calendar section"),
    );
  }
}
