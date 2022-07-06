import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';
import 'package:vms/custom_widgets/custom_error_label.dart';
import 'package:vms/custom_widgets/custom_input_label.dart';
import 'package:vms/models/api_response.dart';
import 'package:vms/models/location.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/notifiers/locations_notifier.dart';
import 'package:vms/services/location_service.dart';

class LocationSection extends StatefulWidget {
  final String labelText;
  final List<Location> locationsList;

  const LocationSection(
      {Key? key, required this.labelText, required this.locationsList})
      : super(key: key);

  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setState(() {
    //   isLoading = true;
    // });
    // service.getLocations().then((response) {
    //   _locationsList = response;
    //   print("location list: ${_locationsList}");
    //   setState(() {
    //     isLoading = false;
    //   });
    // });
  }

  Location getLocationByName(String name, List<Location> locations) {
    if (locations != null) {
      try {
        Location location = locations.firstWhere((e) => e.name == name);
        return location;
      } on StateError {
        return locations[0];
      }
    }

    return locations[0];
  }

  List<dynamic> extractLocations(List<Location>? locations) {
    if (locations != null) {
      List<dynamic> locationsNames = locations
          .map(
            (e) => e.name,
          )
          .toList();
      return locationsNames;
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    String location =
        context.read<AppointmentNotifier>().appointments[0].location;
    String locationText = location.isEmpty
        ? context.read<LocationsNotifier>().currentLocation.name
        : location;
    print("location here: ${location}");
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputLabel(labelText: "Location"),
          CustomErrorLabel(
            errorText: context
                .read<AppointmentNotifier>()
                .allLocationErrors["location"],
          ),
          CustomDropDown(
              text: locationText,
              onTap: (value) {
                var currentLocation =
                    getLocationByName(value, widget.locationsList);

                context.read<LocationsNotifier>().setCurrentLocation =
                    currentLocation;
                context.read<LocationsNotifier>().setCurrentFloors =
                    currentLocation.floors;
                print("current location: ${currentLocation}");

                context.read<AppointmentNotifier>().addLocation(value);
                context
                    .read<AppointmentNotifier>()
                    .addFloor(currentLocation.floors[0].name);
              },
              lists: extractLocations(widget.locationsList).toSet()),
        ],
      ),
    );
  }
}
