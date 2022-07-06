import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/models/api_response.dart';
import 'package:vms/models/location.dart';
import 'package:vms/models/floor.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/notifiers/locations_notifier.dart';
import 'package:vms/partials/appointment_location/room.dart';
import 'package:vms/services/location_service.dart';
import 'package:vms/views/maker/visitor_information.dart';
import 'package:vms/partials/appointment_location/floor.dart';
import 'package:vms/views/maker/new_appointment.dart';
import 'package:vms/partials/appointment_location/location.dart';
import 'package:vms/partials/common/bottom_fixed_section.dart';
import 'package:vms/partials/common/top.dart';

class AppointmentLocation extends StatefulWidget {
  const AppointmentLocation({Key? key}) : super(key: key);

  @override
  State<AppointmentLocation> createState() => _AppointmentLocationState();
}

class _AppointmentLocationState extends State<AppointmentLocation> {
  LocationService get service => GetIt.I<LocationService>();
  late APIResponse<List<Location>> _locationsList;
  LocationsNotifier locationsNotifier = LocationsNotifier();

  List<Location> fallbackLocation = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fallbackLocation.add(locationsNotifier.currentLocation);

    locationsNotifier = Provider.of<LocationsNotifier>(context, listen: false);

    setState(() {
      isLoading = true;
    });
    service.getLocations().then((response) {
      _locationsList = response;
      if (_locationsList.data != null) {
        locationsNotifier.setCurrentLocation = _locationsList.data![0];
        locationsNotifier.setCurrentFloors = _locationsList.data![0].floors;
      } else {
        locationsNotifier.setCurrentFloors = fallbackLocation[0].floors;
      }

      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context);

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
                TopSection(leftText: "Select Location", rightText: "Cancel"),
                Divider(),
                LocationSection(
                  labelText: "Location",
                  locationsList: _locationsList.data ?? fallbackLocation,
                ),
                FloorSection(labelText: "Floor"),
                Room(onComplete: (value) {
                  _appointmentNotifier.addMeetingRoom(value);
                }),
                Divider(),
                BottomFixedSection(
                  leftText: "Back",
                  rightText: "Continue",
                  fnOne: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewAppointment()));
                  },
                  fnTwo: () {
                    context.read<AppointmentNotifier>().showAppointment(
                        context.read<AppointmentNotifier>().appointments[0]);

                    context.read<AppointmentNotifier>().locationValid();
                    if (context
                        .read<AppointmentNotifier>()
                        .allLocationErrors
                        .isEmpty) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => VisitorInformation(),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          );
  }
}
