import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';
import 'package:vms/custom_widgets/custom_error_label.dart';
import 'package:vms/custom_widgets/custom_input_label.dart';
import 'package:vms/models/floor.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/notifiers/locations_notifier.dart';

class FloorSection extends StatelessWidget {
  final String labelText;

  const FloorSection({Key? key, required this.labelText}) : super(key: key);

  List<dynamic> extractFloorsNames(List<Floor>? floors) {
    if (floors != null) {
      List<dynamic> floorsNames = floors
          .map(
            (e) => e.name,
          )
          .toList();
      return floorsNames;
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    String floorNumber =
        context.read<AppointmentNotifier>().appointments[0].floorNumber;
    print("floor number ${floorNumber}");
    String floor = floorNumber.isEmpty
        ? context.read<LocationsNotifier>().currentLocation.floors[0].name
        : floorNumber;
    List<Floor> floors = context.read<LocationsNotifier>().currentFloors;
    List<dynamic> lists = extractFloorsNames(floors);

    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputLabel(labelText: "Floor"),
          CustomErrorLabel(
            errorText:
                context.read<AppointmentNotifier>().allLocationErrors["floor"],
          ),
          CustomDropDown(
            onTap: (value) {
              context.read<AppointmentNotifier>().addFloor(value);
              context.read<AppointmentNotifier>().removeError("floor");
              context.read<LocationsNotifier>().setCurrentFloors =
                  context.read<LocationsNotifier>().currentLocation.floors;
            },
            text: floor,
            lists: lists.toSet(),
          ),
        ],
      ),
    );
  }
}
