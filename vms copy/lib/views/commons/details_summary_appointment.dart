import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_text_with_background.dart';
import 'package:vms/helperfunctions/custom_date_formatter.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/partials/common/summary_footer_timestamp.dart';

class DetailsSummaryAppointment extends StatelessWidget {
  final bool isSummary;
  final String? officiality;
  final String? appointmentType;
  final String? appointmentStatus;
  final String? appointmentDate;
  final String? startTime;
  final String? endTime;

  DetailsSummaryAppointment({
    Key? key,
    required this.isSummary,
    this.officiality,
    this.appointmentType,
    this.appointmentStatus,
    this.appointmentDate,
    this.startTime,
    this.endTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          child: Row(
            children: [
              CustomTextWithBackground(
                text: _appointmentNotifier.appointments[0].officiality,
                textColor: Palette.CUSTOM_WHITE,
                backgroundColor: Palette.FBN_BLUE,
                fn: () {},
              ),
              SizedBox(
                width: 5,
              ),
              CustomTextWithBackground(
                text: isSummary
                    ? _appointmentNotifier.appointments[0].appointmentType
                    : appointmentType ?? "",
                textColor: Palette.FBN_BLUE,
                backgroundColor: Palette.CUSTOM_YELLOW,
                fn: () {},
              ),
              SizedBox(
                width: 5,
              ),
              CustomTextWithBackground(
                text: isSummary ? "Pending" : appointmentStatus ?? "-",
                textColor: Palette.CUSTOM_WHITE,
                backgroundColor:
                    isSummary ? Palette.FBN_ORANGE : Palette.FBN_GREEN,
                fn: () {},
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            CustomDateFormatter.getFormattedDay(
                _appointmentNotifier.appointments[0].appointmentDate),
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        Container(
          child: SummaryFooterTimestamp(
            stampText: CustomDateFormatter.combineTime(
                CustomDateFormatter.getFormattedTime(
                    _appointmentNotifier.appointments[0].startTime),
                CustomDateFormatter.getFormattedTime(
                    _appointmentNotifier.appointments[0].endTime)),
          ),
        ),
      ]),
    );
  }
}
