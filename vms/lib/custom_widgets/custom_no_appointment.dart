import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vms/custom_widgets/custom_appointment_day_date.dart';

class NoAppointment extends StatelessWidget {
  final DateTime selectedDate;
  const NoAppointment({
    Key? key,
    required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, top: 22),
      child: Column(
        children: [
          AppointmentDayDate(
            selectedDate: selectedDate,
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, bottom: 20, top: 12),
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Color(0xffF0F4FA),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xffE2E4E8),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "No appointments",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text("Create an appointment"),
                  ],
                ),
                Container(
                  child: Icon(Icons.add),
                )
              ],
            ),
          ),
          Divider(
            thickness: 0.8,
          ),
        ],
      ),
    );
  }
}
