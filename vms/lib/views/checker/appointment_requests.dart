import 'package:flutter/material.dart';
import 'package:vms/custom_widgets/custom_appointment_requests_card.dart';
import 'package:vms/models/AppointmentRequest.dart';
import 'package:vms/partials/appointment_requests/page_title.dart';
import 'package:vms/partials/appointment_requests/staff_details.dart';

class AppointmentRequests extends StatefulWidget {
  const AppointmentRequests({Key? key}) : super(key: key);

  @override
  State<AppointmentRequests> createState() => _AppointmentRequestsState();
}

class _AppointmentRequestsState extends State<AppointmentRequests> {
  List<AppointmentRequest> appointmentRequests = [
    new AppointmentRequest(
      address: "3 Lateef Jakande Road, Ikeja",
      staffImagePath: "assets/images/fbn_logo_bg_2x.png",
      appointmentType: "Regular",
      date: "12/12/22",
      startTime: "12:00 PM",
      endTime: "01:00 PM",
      noOfGuests: 1,
      officialityStatus: "Official",
      staffName: "Omobowale Otuyiga",
    ),
    new AppointmentRequest(
      address: "Marina Estate, CMS",
      staffImagePath: "assets/images/selected_icon.png",
      appointmentType: "VVIP",
      date: "13/12/22",
      startTime: "09:00 AM",
      endTime: "12:00 PM",
      noOfGuests: 2,
      officialityStatus: "Personal",
      staffName: "Adebisi Adekunle",
    ),
    new AppointmentRequest(
      address: "Elebute Close, Ketu",
      staffImagePath: "assets/images/fbn_logo_bg_2x.png",
      appointmentType: "Regular",
      date: "14/12/22",
      startTime: "01:00 PM",
      endTime: "05:00 PM",
      noOfGuests: 3,
      officialityStatus: "Official",
      staffName: "Peter Joe",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          PageTitle(),
          Divider(),
          Column(
            children: appointmentRequests.map((appointmentRequest) {
              return AppointmentRequestsCard(
                  startTime: appointmentRequest.startTime,
                  endTime: appointmentRequest.endTime,
                  officialityText: appointmentRequest.officialityStatus,
                  appointmentTypeText: appointmentRequest.appointmentType,
                  date: appointmentRequest.date,
                  address: appointmentRequest.address,
                  staffImagePath: appointmentRequest.staffImagePath,
                  staffName: appointmentRequest.staffName,
                  noOfGuests: appointmentRequest.noOfGuests);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
