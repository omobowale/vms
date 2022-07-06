import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';
import 'package:vms/custom_widgets/custom_error_label.dart';
import 'package:vms/custom_widgets/custom_input_label.dart';
import 'package:vms/models/api_response.dart';
import 'package:vms/models/location.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
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

  List<dynamic> extractLocations(List<Location>? locations) {
    if (locations != null) {
      List<dynamic> reasons = locations
          .map(
            (e) => e.name,
          )
          .toList();
      return reasons;
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    var location = context.read<AppointmentNotifier>().appointments[0].location;
    print("location: ${location}");
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
              text: location == "" ? widget.locationsList[0].name : location,
              onTap: (value) {
                context.read<AppointmentNotifier>().addLocation(value);
              },
              lists: extractLocations(widget.locationsList).toSet()),
        ],
      ),
    );
  }
}
