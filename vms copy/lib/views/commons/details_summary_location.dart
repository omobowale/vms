import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_text_title.dart';
import 'package:vms/helperfunctions/custom_array_string_manipulations.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/partials/common/summary_footer_timestamp.dart';

class DetailsSummaryLocation extends StatefulWidget {
  final String? floorNumber;
  final List<dynamic>? roomNumbers;
  const DetailsSummaryLocation({
    Key? key,
    this.floorNumber,
    this.roomNumbers,
  }) : super(key: key);

  @override
  State<DetailsSummaryLocation> createState() => _DetailsSummaryLocationState();
}

class _DetailsSummaryLocationState extends State<DetailsSummaryLocation> {
  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context);
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextTitle(title: "Location"),
          Text(
            "${_appointmentNotifier.appointments[0].location} [${_appointmentNotifier.appointments[0].floorNumber}]",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          ..._appointmentNotifier.appointments[0].rooms.map(
            (e) {
              return Text(
                e.name,
                style: TextStyle(),
              );
            },
          )
        ],
      ),
    );
  }
}
