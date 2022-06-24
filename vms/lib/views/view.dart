import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_appointment_day_date.dart';
import 'package:vms/custom_widgets/custom_calendar_strip_section.dart';
import 'package:vms/custom_widgets/custom_no_appointment.dart';
import 'package:vms/models/api_response.dart';
import 'package:vms/models/appointment.dart';
import 'package:vms/services/appointment_service.dart';
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
  DateTime selectedDate = DateTime.now();

  late APIResponse<List<Appointment>> _appointmentList;

  @override
  void initState() {
    _appointmentList =
        new APIResponse<List<Appointment>>(data: [], error: false);
    _fetchAppointments();
    // TODO: implement initState
    super.initState();
  }

  onSelect(data) {
    if (data != null) {
      setState(() {
        selectedDate = data;
      });
      print("Selected Date -> $data");
    }
  }

  _fetchAppointments() async {
    setState(() {
      isLoading = true;
    });

    _appointmentList = await service.getAppointments();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Palette.FBN_BLUE,
              ),
            )
          : ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCalendarStrip(
                      onSelect: onSelect,
                      selectedDate: selectedDate,
                    ),
                    AppointmentDayDate(selectedDate: selectedDate),
                    AppointmentList(
                        appointmentList: _appointmentList.data ?? []),
                    NoAppointment(
                      selectedDate: selectedDate,
                    ),
                  ],
                ),
              ],
            ),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Palette.FBN_BLUE,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            label: 'Home',
            icon: ImageIcon(
              AssetImage("assets/images/navigation_home_icon.png"),
              color: Palette.CUSTOM_WHITE,
            ),
          ),
          new BottomNavigationBarItem(
            label: 'Folder',
            icon: ImageIcon(
              AssetImage("assets/images/navigation_folder_icon.png"),
              color: Palette.CUSTOM_WHITE,
            ),
          ),
          new BottomNavigationBarItem(
            label: 'Notification',
            icon: ImageIcon(
              AssetImage("assets/images/navigation_notification_icon.png"),
              color: Palette.CUSTOM_WHITE,
            ),
          ),
          new BottomNavigationBarItem(
            label: 'Four',
            icon: Text(""),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: Palette.CUSTOM_WHITE, width: 5.0),
              color: Palette.CUSTOM_YELLOW,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(500.0),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NewAppointment()));
              },
              child: Icon(
                Icons.add,
                //size: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
