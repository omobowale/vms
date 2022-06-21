import 'package:flutter/material.dart';
import 'package:vms/custom_widgets/custom_check_box.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';
import 'package:vms/models/Room.dart';

class RoomsList extends StatelessWidget {
  final List<Room> roomslist;

  const RoomsList({Key? key, required this.roomslist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text(
                "Choose up to 3 rooms",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )),
          Container(
            child: Column(
              children: roomslist
                  .map(
                    (room) => new CustomCheckBox(
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
