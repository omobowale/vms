import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/partials/appointment_requests/address.dart';
import 'package:vms/partials/appointment_requests/appointment_type.dart';
import 'package:vms/partials/appointment_requests/guests.dart';
import 'package:vms/partials/appointment_requests/officiality_status.dart';
import 'package:vms/partials/appointment_requests/staff_details.dart';
import 'package:vms/partials/appointment_requests/time_stamp.dart';
import 'package:vms/partials/common/bottom_fixed_section_small.dart';

class AppointmentRequestsCard extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String officialityText;
  final String appointmentTypeText;
  final String date;
  final String address;
  final int noOfGuests;
  final String staffName;
  final String staffImagePath;

  const AppointmentRequestsCard({
    Key? key,
    required this.startTime,
    required this.endTime,
    required this.officialityText,
    required this.appointmentTypeText,
    required this.date,
    required this.address,
    required this.noOfGuests,
    required this.staffImagePath,
    required this.staffName,
  }) : super(key: key);

  String getTimes(startTime, endTime) {
    return "$startTime - $endTime";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Palette.CUSTOM_WHITE,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Column(
            children: [
              StaffDetails(staffName: staffName, staffImagePath: staffImagePath),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: OfficialityStatus(
                        officialityText: officialityText,
                        officialityBackgroundColor: Palette.FBN_BLUE,
                        textColor: Palette.CUSTOM_WHITE,
                      ),
                    ),
                    SizedBox(width: 6),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: AppointmentType(
                        appointmentTypeText: appointmentTypeText,
                        backgroundColor: Palette.CUSTOM_YELLOW,
                        textColor: Palette.CUSTOM_WHITE,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: TimeStamp(
                  date: date,
                  time: getTimes(startTime, endTime),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Address(
                  address: address,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Guests(
                  noOfGuests: noOfGuests,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 3,
                  child: BottomFixedSectionSmall(
                    leftText: "Deny",
                    rightText: "Approve",
                    fnOne: () {},
                    fnTwo: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
