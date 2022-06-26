import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_check_box.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';
import 'package:vms/custom_widgets/custom_input_label.dart';
import 'package:vms/data/rooms.dart';
import 'package:vms/models/Room.dart';
import 'package:vms/models/appointment.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/notifiers/rooms_notifier.dart';

class RoomsList extends StatelessWidget {
  const RoomsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context);
    RoomsNotifier _roomsNotifier = Provider.of<RoomsNotifier>(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputLabel(
            labelText: "Choose up to 3 rooms",
          ),
          Container(
            child: Column(
              children: _roomsNotifier.allrooms
                  .map(
                    (room) => CustomCheckBox(
                        id: room.id,
                        isClicked: (id) {
                          _appointmentNotifier.addRoom(room);
                        },
                        checkList: _appointmentNotifier.appointments[0].rooms,
                        labelText: room.name.toString(),
                        checked: room.checked,
                        isAvailable: room.isAvailable),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
