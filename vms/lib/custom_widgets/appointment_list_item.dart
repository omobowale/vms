import 'package:flutter/material.dart';

class AppointmentListItem extends StatefulWidget {
  final String dateTime;
  final String appointmentType;
  final String visitorName;
  final bool isGroupVisit;

  const AppointmentListItem({
    Key? key,
    required this.dateTime,
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
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 2,
            color: widget.isGroupVisit
                ? Colors.grey.withOpacity(0.3)
                : Colors.green,
          ),
        ),
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 3, left: 8),
            child: Text(widget.dateTime),
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
    );
  }
}
