import 'package:flutter/material.dart';
import 'package:vms/helperfunctions/custom_array_string_manipulations.dart';
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Location"),
          SummaryFooterTimestamp(
            stampText:
                "Floor ${widget.floorNumber}, Meeting Room ${CustomArrayStringManipulations.convertArrayToString(
              widget.roomNumbers ?? [],
            )}",
          )
        ],
      ),
    );
  }
}
