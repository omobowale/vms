import 'package:flutter/material.dart';
import 'package:vms/partials/common/summary_footer_timestamp.dart';
import 'package:vms/partials/common/summary_footer_timestamp_with_array.dart';

class DetailsSummaryGuests extends StatefulWidget {
  List<dynamic> guestsList;
  DetailsSummaryGuests({Key? key, required this.guestsList}) : super(key: key);

  @override
  State<DetailsSummaryGuests> createState() => _DetailsSummaryGuestsState();
}

class _DetailsSummaryGuestsState extends State<DetailsSummaryGuests> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Guests"),
          widget.guestsList.isNotEmpty
              ? SummaryFooterTimestampWithArray(
                  stampTextsList: widget.guestsList,
                )
              : SummaryFooterTimestampWithArray(
                  stampTextsList: [], buttonText: "Edit"),
        ],
      ),
    );
  }
}
