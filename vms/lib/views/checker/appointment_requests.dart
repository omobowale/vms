import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_appointment_requests_card.dart';
import 'package:vms/custom_widgets/custom_bottom_navigation_bar.dart';
import 'package:vms/custom_widgets/custom_floating_action_button.dart';
import 'package:vms/data/appointment_statuses.dart';
import 'package:vms/helperfunctions/custom_date_formatter.dart';
import 'package:vms/helperfunctions/modify_appointment.dart';
import 'package:vms/models/api_response.dart';
import 'package:vms/models/appointment.dart';
import 'package:vms/models/appointment_request.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/notifiers/user_notifier.dart';
import 'package:vms/partials/appointment_requests/page_title.dart';
import 'package:vms/partials/appointment_requests/staff_details.dart';
import 'package:vms/services/appointment_service.dart';

class AppointmentRequests extends StatefulWidget {
  const AppointmentRequests({Key? key}) : super(key: key);

  @override
  State<AppointmentRequests> createState() => _AppointmentRequestsState();
}

class _AppointmentRequestsState extends State<AppointmentRequests> {
  late APIResponse<List<Appointment>> _appointmentList;
  late Future<APIResponse<List<Appointment>>> _appointmentList2;

  List<AppointmentRequest> appointmentRequests = [];
  AppointmentService get service => GetIt.I<AppointmentService>();

  UserNotifier _userNotifier = UserNotifier();

  bool isGH = false;
  bool isLoading = false;
  int noOfRequests = 0;
  late Future<String> GHId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    _appointmentList =
        new APIResponse<List<Appointment>>(data: [], error: false);

    GHId = _userNotifier.getGHId();
    _appointmentList2 = service.getAppointments();

    service.getAppointments().then((response) {
      _appointmentList = response;

      _userNotifier.isGH().then((value) {
        setState(() {
          isLoading = false;
          isGH = value;
          var requests = AppointmentNotifier.getPendingAppointmentRequests(
              _appointmentList.data ?? []);
          print("requests: " + requests.toString());
          noOfRequests = requests.length;
        });
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    print("number of requests " + noOfRequests.toString());
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Palette.FBN_BLUE,
              ),
            ),
          )
        : Scaffold(
            body: ListView(
              children: [
                PageTitle(),
                Divider(),
                FutureBuilder<APIResponse<List<Appointment>>>(
                  future: _appointmentList2,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data != null) {
                        if (snapshot.data!.data != null) {
                          print("snapshot.data: ${snapshot.data!.data}");
                          APIResponse<List<Appointment>> data = snapshot.data!;
                          return Column(
                            children: data.data!.map((appointmentRequest) {
                              if (appointmentRequest.appointmentStatus ==
                                  PENDING) {
                                return AppointmentRequestsCard(
                                    floorNumber: appointmentRequest.floorNumber,
                                    meetingRoom: appointmentRequest.meetingRoom,
                                    location: appointmentRequest.location,
                                    guests: appointmentRequest.guests,
                                    groupHead: appointmentRequest.groupHead,
                                    appointmentId: appointmentRequest.id,
                                    startTime: appointmentRequest.startTime,
                                    endTime: appointmentRequest.endTime,
                                    officialityText:
                                        appointmentRequest.visitType,
                                    appointmentTypeText:
                                        appointmentRequest.appointmentType,
                                    date: appointmentRequest.appointmentDate,
                                    address: appointmentRequest.location,
                                    staffImagePath:
                                        "assets/images/image_placeholder.jpg",
                                    host: appointmentRequest.host,
                                    noOfGuests:
                                        appointmentRequest.guests.length);
                              }
                              return SizedBox.shrink();
                            }).toList(),
                          );
                        } else {
                          Future.delayed(
                            Duration.zero,
                            () => showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Error"),
                                  content: Text(
                                    "Could not fetch appointment requests.\nPlease try again later!",
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/view');
                                      },
                                      child: Text("Ok"),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        }
                      }
                    } else if (snapshot.hasError) {
                      return Text(
                        "Error fetching requests. Please try again later",
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
            // : SizedBox(
            //     height: double.infinity,
            //     child: Center(
            //       child: Text(
            //         "No appointment requests",
            //         style: TextStyle(
            //           fontWeight: FontWeight.w500,
            //           fontSize: 16,
            //         ),
            //       ),
            //     ),
            //   ),
            bottomNavigationBar: CustomBottomNavigationBar(
              isGH: isGH,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            floatingActionButton: CustomFloatingActionButton(),
          );
  }
}
