import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_appointment_day_date.dart';
import 'package:vms/custom_widgets/custom_bottom_navigation_bar.dart';
import 'package:vms/custom_widgets/custom_calendar_strip_section.dart';
import 'package:vms/custom_widgets/custom_floating_action_button.dart';
import 'package:vms/custom_widgets/custom_no_appointment.dart';
import 'package:vms/models/api_response.dart';
import 'package:vms/models/appointment.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/notifiers/login_logout_notifier.dart';
import 'package:vms/notifiers/user_notifier.dart';
import 'package:vms/services/appointment_service.dart';
import 'package:vms/views/login.dart';
import 'package:vms/views/maker/new_appointment.dart';
import 'package:vms/partials/view/appointment_list.dart';

class View extends StatefulWidget {
  View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  AppointmentService get service => GetIt.I<AppointmentService>();
  bool isLoading = false;
  bool isGH = false;
  int _selectedIndex = 0;
  DateTime selectedDate = DateTime.now();

  late APIResponse<List<Appointment>> _appointmentList;
  List<Appointment> appointmentListData = [];
  List<DateTime> markedDates = [];

  UserNotifier userNotifier = UserNotifier();

  @override
  void initState() {
    _appointmentList =
        new APIResponse<List<Appointment>>(data: [], error: false);

    _fetchAppointmentForDay();
    // TODO: implement initState
    super.initState();
  }

  onSelect(data) {
    if (data != null) {
      setState(() {
        selectedDate = data;
      });
      print("Selected Date -> $data");
      _fetchAppointmentForDay();
    }
  }

  _fetchAppointmentForDay() async {
    _fetchAppointmentsAndUserRole().then((_) {
      userNotifier.isGH().then((value) {
        print("user is GH: " + value.toString());

        setState(() {
          isLoading = false;
          isGH = value;
          appointmentListData = AppointmentNotifier.fetchAppointmentForDay(
              _appointmentList.data ?? [], selectedDate);
          markedDates =
              AppointmentNotifier.getMarkedDates(_appointmentList.data ?? []);
        });
      });
    });
  }

  _fetchAppointmentsAndUserRole() async {
    setState(() {
      isLoading = true;
    });

    _appointmentList = await service.getAppointments();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = context.read<LoginLogoutNotifier>().isLoggedIn;
    return !isLoading
        ? Scaffold(
            body: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCalendarStrip(
                      onSelect: onSelect,
                      selectedDate: selectedDate,
                      markedDates: markedDates,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                      child: appointmentListData.length > 0
                          ? Column(
                              children: [
                                AppointmentDayDate(selectedDate: selectedDate),
                                AppointmentList(
                                    appointmentList: appointmentListData),
                              ],
                            )
                          : NoAppointment(
                              selectedDate: selectedDate,
                            ),
                    ),
                  ],
                ),
              ],
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              isGH: isGH,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            floatingActionButton: CustomFloatingActionButton(),
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Palette.FBN_BLUE,
              ),
            ),
          );
  }
}
