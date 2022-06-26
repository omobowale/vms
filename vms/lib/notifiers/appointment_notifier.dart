import 'package:flutter/material.dart';
import 'package:vms/data/asset_present_bools.dart';
import 'package:vms/data/floors.dart';
import 'package:vms/data/locations.dart';
import 'package:vms/data/purposes_of_visit.dart';
import 'package:vms/data/rooms.dart';
import 'package:vms/models/asset.dart';
import 'package:vms/models/room.dart';
import 'package:vms/models/appointment.dart';
import 'package:vms/models/visitor.dart';
import 'package:vms/notifiers/purpose_notifier.dart';
import 'package:vms/partials/new_appointment/purpose_of_visit.dart';

class AppointmentNotifier with ChangeNotifier {
  List<Appointment> _appointmentsList = [];
  bool _completed = false;

  List<Appointment> get appointments {
    return [..._appointmentsList];
  }

  void set completed(bool completed) {
    _completed = completed;
    notifyListeners();
  }

  void addEmptyAppointment() {
    Visitor newVisitor = Visitor(
        id: "1",
        firstName: "",
        lastName: "",
        address: "",
        email: "",
        phoneNumber: "");
    _appointmentsList.add(
      new Appointment(
        id: _appointmentsList.length.toString(),
        staffName: "",
        officiality: "",
        startTime: DateTime.now(),
        assetPresent: "",
        endTime: DateTime.now(),
        appointmentType: "",
        approvalStatus: "",
        staffImagePath: "",
        appointmentDate: DateTime.now(),
        floorNumber: floors[0],
        guests: [newVisitor],
        rooms: [],
        assets: [],
        location: locations[0],
        visitPurpose: purposesOfVisit[0],
      ),
    );
    notifyListeners();
  }

  void addGuests(List<dynamic> guests) {
    _appointmentsList[_appointmentsList.length - 1].guests = guests;
    notifyListeners();
  }

  void addAssetPresentBool(String yes_no) {
    _appointmentsList[_appointmentsList.length - 1].assetPresent = yes_no;
    notifyListeners();
  }

  void addVisitorType(String visitorType) {
    _appointmentsList[_appointmentsList.length - 1].appointmentType =
        visitorType;
    notifyListeners();
  }

  void addHostName(String hostName) {
    _appointmentsList[_appointmentsList.length - 1].staffName = hostName;
    notifyListeners();
  }

  void addVisitorId(Visitor visitor, String id) {
    visitor.id = id;
    notifyListeners();
  }

  void addVisitorFirstName(Visitor visitor, String firstName) {
    visitor.firstName = firstName;
    notifyListeners();
  }

  void addVisitorLastName(Visitor visitor, String lastName) {
    visitor.lastName = lastName;
    notifyListeners();
  }

  void addVisitorEmail(Visitor visitor, String email) {
    visitor.email = email;
    notifyListeners();
  }

  void addVisitorAddress(Visitor visitor, String address) {
    visitor.address = address;
    notifyListeners();
  }

  void addVisitorPhoneNumber(Visitor visitor, String phoneNumber) {
    visitor.phoneNumber = phoneNumber;
    notifyListeners();
  }

  void addStartTime(DateTime startTime) {
    _appointmentsList[_appointmentsList.length - 1].startTime = startTime;
    notifyListeners();
  }

  void addEndTime(DateTime endTime) {
    _appointmentsList[_appointmentsList.length - 1].endTime = endTime;
    notifyListeners();
  }

  void addAppointmentDate(DateTime appointmentDate) {
    _appointmentsList[_appointmentsList.length - 1].appointmentDate =
        appointmentDate;
    notifyListeners();
  }

  void addLocation(String location) {
    _appointmentsList[_appointmentsList.length - 1].location = location;
    notifyListeners();
  }

  void addRoom(Room room) {
    var existingRooms = _appointmentsList[_appointmentsList.length - 1].rooms;
    var r =
        existingRooms.firstWhere((_) => room.id == _.id, orElse: () => null);

    if (r != null) {
      _appointmentsList[_appointmentsList.length - 1].rooms.remove(r);
    } else {
      if (existingRooms.length < 3) {
        _appointmentsList[_appointmentsList.length - 1].rooms.add(room);
      }
    }

    notifyListeners();
  }

  void addAsset(Asset asset) {
    var existingAssets = _appointmentsList[_appointmentsList.length - 1].assets;
    var a =
        existingAssets.firstWhere((_) => asset.id == _.id, orElse: () => null);

    if (a != null) {
      _appointmentsList[_appointmentsList.length - 1].assets.remove(a);
    } else {
      _appointmentsList[_appointmentsList.length - 1].assets.add(asset);
    }

    notifyListeners();
  }

  void addRooms(List<dynamic> rooms) {
    _appointmentsList[_appointmentsList.length - 1].rooms = rooms;
    notifyListeners();
  }

  void addVisitPurpose(String visitPurpose) {
    _appointmentsList[_appointmentsList.length - 1].visitPurpose = visitPurpose;
    notifyListeners();
  }

  void addAppointment(Appointment appointment) {
    _appointmentsList.add(appointment);
    notifyListeners();
  }

  void addFloor(String floor) {
    _appointmentsList[_appointmentsList.length - 1].floorNumber = floor;
    notifyListeners();
    notifyListeners();
  }

  void showAppointment(Appointment appointment) {
    var app = "";
    app += "appointment date: " + appointment.appointmentDate.toString() + "\n";
    app += "room : " + appointment.rooms.toString() + "\n";
    app += "staff name: " + appointment.staffName.toString() + "\n";
    app += "visit purpose: " + appointment.visitPurpose.toString() + "\n";
    app += "end time: " + appointment.endTime.toString() + "\n";
    app += "start time: " + appointment.startTime.toString() + "\n";
    app += "officiality: " + appointment.officiality.toString() + "\n";
    app += "appointment type: " + appointment.appointmentType.toString() + "\n";
    app += "location" + appointment.location.toString() + "\n";
    app += "floor" + appointment.floorNumber.toString() + "\n";
    print(app);
  }
}
