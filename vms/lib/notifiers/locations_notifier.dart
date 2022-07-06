import 'package:flutter/material.dart';
import 'package:vms/models/floor.dart';
import 'package:vms/models/location.dart';

class LocationsNotifier with ChangeNotifier {
  Location _currentLocation = Location(
    name: "Others",
    id: 0,
    floors: [],
  );

  List<Floor> _currentFloors = [];

  Location get currentLocation => _currentLocation;

  List<Floor> get currentFloors => _currentFloors;

  void set setCurrentLocation(Location location) {
    _currentLocation = location;
    notifyListeners();
  }

  void set setCurrentFloors(List<Floor> floors) {
    _currentFloors = floors;
    notifyListeners();
  }
}
