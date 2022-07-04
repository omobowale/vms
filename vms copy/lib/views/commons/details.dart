import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_single_line_button.dart';
import 'package:vms/helperfunctions/custom_date_formatter.dart';
import 'package:vms/models/api_response.dart';
import 'package:vms/models/appointment.dart';
import 'package:vms/partials/common/bottom_fixed_section.dart';
import 'package:vms/partials/common/top.dart';
import 'package:vms/partials/common/top_swap.dart';
import 'package:vms/partials/summary/add_another_link.dart';
import 'package:vms/services/appointment_service.dart';
import 'package:vms/views/commons/details_summary_appointment.dart';
import 'package:vms/views/commons/details_summary_guests.dart';
import 'package:vms/views/commons/details_summary_location.dart';
import 'package:vms/views/maker/reschedule_appointment.dart';
import 'package:vms/views/maker/visitor_information.dart';
import 'package:vms/views/maker/appointment_creation_success.dart';

class Details extends StatefulWidget {
  final String id;
  const Details({Key? key, required this.id}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  AppointmentService get service => GetIt.I<AppointmentService>();
  bool isLoading = false;
  APIResponse<Appointment> appointment = new APIResponse<Appointment>();

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });

    service.getAppointment(widget.id).then((data) {
      appointment = data;
      print("single appointment: " + appointment.data.toString());
      setState(() {
        isLoading = false;
      });
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        toolbarHeight: 0,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: Palette.FBN_BLUE,
            ))
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    TopSwapSection(
                      leftText: "Back",
                      rightText: "Details",
                      fnOne: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Divider(),
                    DetailsSummaryAppointment(
                        isSummary: false,
                        officiality: appointment.data?.officiality,
                        appointmentType: appointment.data?.appointmentType,
                        appointmentStatus: appointment.data?.appointmentStatus,
                        appointmentDate: CustomDateFormatter.getFormattedDay(
                            appointment.data?.appointmentDate ?? null),
                        startTime: CustomDateFormatter.getFormattedTime(
                            appointment.data?.startTime ?? null),
                        endTime: CustomDateFormatter.getFormattedTime(
                            appointment.data?.endTime ?? null)),
                    Divider(),
                    DetailsSummaryLocation(
                      floorNumber: appointment.data?.floorNumber.toString(),
                      roomNumbers: appointment.data?.rooms,
                    ),
                    Divider(),
                    DetailsSummaryGuests(),
                    Divider(),
                    Text(widget.id),
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: CustomSingleLineButton(
                          text: 'Cancel Appointment',
                          backgroundColor: Color(0xffF7F2F3),
                          textColor: Color(0xffED682F),
                          fn: () {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 20),
                        child: CustomSingleLineButton(
                          text: 'Reschedule Appointment',
                          backgroundColor: Color(0xffEBF1F7),
                          textColor: Palette.FBN_BLUE,
                          fn: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RescheduleAppointment()));
                          },
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
