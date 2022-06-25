import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_date_time_selector.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';
import 'package:vms/data/purposes_of_visit.dart';
import 'package:vms/helperfunctions/custom_date_formatter.dart';
import 'package:vms/notifiers/appointment_notifier.dart';

class DateTimeSection extends StatelessWidget {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      context.read<AppointmentNotifier>().addAppointmentDate(picked);
      print(context.read<AppointmentNotifier>().appointments.toString());
    }
  }

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final TimeOfDay? picked_s =
        await showTimePicker(context: context, initialTime: selectedTime);

    if (picked_s != null && picked_s != selectedTime) {
      return picked_s;
    }
    return selectedTime;
  }

  @override
  Widget build(BuildContext context) {
    AppointmentNotifier appointmentNotifier =
        Provider.of<AppointmentNotifier>(context, listen: false);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 20),
            child: Text(
              "Date & Time",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CustomDateTimeSelector(
            icon: Icon(
              Icons.calendar_today,
              color: Palette.FBN_BLUE,
            ),
            onTap: () {
              _selectDate(context);
            },
            selectedText: CustomDateFormatter.getFormatedDate(context
                .watch<AppointmentNotifier>()
                .appointments[appointmentNotifier.appointments.length - 1]
                .appointmentDate),
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: CustomDateTimeSelector(
                  icon: Icon(
                    Icons.timer_sharp,
                    color: Palette.FBN_BLUE,
                  ),
                  onTap: () {
                    _selectTime(context).then((value) {
                      context.read<AppointmentNotifier>().addStartTime(
                          CustomDateFormatter.getDateTimeFromTimeOfDay(value));
                      print("start time: " +
                          context
                              .read<AppointmentNotifier>()
                              .appointments[0]
                              .startTime
                              .toString());
                    });
                  },
                  selectedText: CustomDateFormatter.getFormattedTime(context
                      .watch<AppointmentNotifier>()
                      .appointments[appointmentNotifier.appointments.length - 1]
                      .startTime),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 5,
                child: CustomDateTimeSelector(
                  icon: Icon(
                    Icons.timer_sharp,
                    color: Palette.FBN_BLUE,
                  ),
                  onTap: () {
                    _selectTime(context).then(
                      (value) {
                        context.read<AppointmentNotifier>().addEndTime(
                              CustomDateFormatter.getDateTimeFromTimeOfDay(
                                  value),
                            );
                        print("end time: " +
                            context
                                .read<AppointmentNotifier>()
                                .appointments[0]
                                .endTime
                                .toString());
                      },
                    );
                  },
                  selectedText: CustomDateFormatter.getFormattedTime(context
                      .watch<AppointmentNotifier>()
                      .appointments[appointmentNotifier.appointments.length - 1]
                      .endTime),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
