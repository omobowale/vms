import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_calendar_strip_section.dart';
import 'package:vms/custom_widgets/custom_no_appointment.dart';
import 'package:vms/partials/view/appointment_list.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCalendarStrip(),
              AppointmentList(),
              NoAppointment(
                date: "13/07/22",
                dayName: "Monday",
              ),
              NoAppointment(
                date: "14/07/22",
                dayName: "Tuesday",
              ),
              NoAppointment(
                date: "15/07/22",
                dayName: "Wednesday",
              ),
              NoAppointment(
                date: "16/07/22",
                dayName: "Thursday",
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
              onTap: () {},
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
