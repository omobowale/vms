import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/views/commons/details.dart';

class AppointmentListItem extends StatefulWidget {
  final String appointmentId;
  final String startTime;
  final String endTime;
  final String appointmentType;
  final String visitorName;
  final bool isGroupVisit;

  const AppointmentListItem({
    Key? key,
    required this.appointmentId,
    required this.startTime,
    required this.endTime,
    required this.appointmentType,
    required this.visitorName,
    required this.isGroupVisit,
  }) : super(key: key);

  @override
  State<AppointmentListItem> createState() => _AppointmentListItemState();
}

class _AppointmentListItemState extends State<AppointmentListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Details(
                  id: widget.appointmentId,
                )));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              width: 2,
              color: widget.isGroupVisit
                  ? Colors.grey.withOpacity(0.3)
                  : Colors.green,
            ),
          ),
          color: Palette.CUSTOM_WHITE,
        ),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 3, left: 8),
              child: Text(
                widget.startTime.toString() + " - " + widget.endTime.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Text(
                    widget.appointmentType,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.circle,
                    size: 8,
                  ),
                ),
                Container(
                  child: Text(
                    widget.visitorName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
