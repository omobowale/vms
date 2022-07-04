import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_text_title.dart';
import 'package:vms/helperfunctions/custom_array_string_manipulations.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/partials/common/summary_footer_timestamp.dart';

class DetailsSummaryAssets extends StatefulWidget {
  const DetailsSummaryAssets({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsSummaryAssets> createState() => _DetailsSummaryAssetsState();
}

class _DetailsSummaryAssetsState extends State<DetailsSummaryAssets> {
  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextTitle(title: "Assets"),
          ..._appointmentNotifier.appointments[0].assets.map(
            (e) {
              return Text(
                e.name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
