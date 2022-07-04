import 'package:flutter/material.dart';
import 'package:vms/data/asset_present_bools.dart';
import 'package:vms/data/floors.dart';
import 'package:vms/data/locations.dart';
import 'package:vms/data/purposes_of_visit.dart';
import 'package:vms/data/time_selection.dart';
import 'package:vms/helperfunctions/custom_date_formatter.dart';
import 'package:vms/helperfunctions/custom_string_manipulations.dart';
import 'package:vms/models/asset.dart';
import 'package:vms/models/room.dart';
import 'package:vms/models/appointment.dart';
import 'package:vms/models/visitor.dart';
import 'package:vms/notifiers/asset_present_bool_notifier.dart';

class AppointmentNotifier with ChangeNotifier {
  List<Appointment> _appointmentsList = [];
  bool _completed = false;

  Map<String, String> newAppointmentErrors = {};
  Map<String, String> locationErrors = {};
  Map<String, String> visitorInformationErrors = {};
  Map<String, String> otherVisitorInformationErrors = {};

  List<Appointment> get appointments {
    return [..._appointmentsList];
  }

  Map<String, String> get allNewAppointmentErrors {
    return {...newAppointmentErrors};
  }

  Map<String, String> get allLocationErrors {
    return {...locationErrors};
  }

  Map<String, String> get allVisitorInformationErrors {
    return {...visitorInformationErrors};
  }

  Map<String, String> get allOtherVisitorInformationErrors {
    return {...otherVisitorInformationErrors};
  }

  void set completed(bool completed) {
    _completed = completed;
    notifyListeners();
  }

  void resetAppointmentList() {
    _appointmentsList.clear();
    notifyListeners();
  }

  void addEmptyAppointment() {
    resetAppointmentList();
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
        startTime: CustomDateFormatter.getDateTimeFromTimeString(
            DateTime.now(), timesSelection[0]),
        assetPresent: "",
        endTime: CustomDateFormatter.getDateTimeFromTimeString(
            DateTime.now(), timesSelection[0]),
        appointmentType: "",
        appointmentStatus: "",
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
    // notifyListeners();
  }

  List<dynamic> getValidGuests() {
    var validGuests = _appointmentsList[_appointmentsList.length - 1].guests;
    try {
      validGuests.where((element) => element.isValid());
      addGuests(validGuests.toList());
      return validGuests.toList();
    } on StateError {
      print("There was an error");
    }

    notifyListeners();
    return validGuests;
  }

  void addGuest() {
    List<dynamic> currentGuests =
        _appointmentsList[_appointmentsList.length - 1].guests;
    int noOfGuests = currentGuests.length;
    if (currentGuests[noOfGuests - 1].isValid()) {
      Visitor newGuest = Visitor(
        id: noOfGuests.toString(),
        firstName: "",
        lastName: "",
        address: "",
        email: "",
        phoneNumber: "",
      );
      _appointmentsList[_appointmentsList.length - 1].guests.add(newGuest);
    }

    print("number of guests now: " +
        _appointmentsList[_appointmentsList.length - 1]
            .guests
            .length
            .toString());
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

  void addOfficialityType(String officialityType) {
    _appointmentsList[_appointmentsList.length - 1].officiality =
        officialityType;
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

  void addStartTime(String startTime) {
    _appointmentsList[_appointmentsList.length - 1].startTime =
        CustomDateFormatter.getDateTimeFromTimeString(
            _appointmentsList[_appointmentsList.length - 1].appointmentDate,
            startTime);
    notifyListeners();
  }

  void addEndTime(String endTime) {
    _appointmentsList[_appointmentsList.length - 1].endTime =
        CustomDateFormatter.getDateTimeFromTimeString(
            _appointmentsList[_appointmentsList.length - 1].appointmentDate,
            endTime);
    notifyListeners();
  }

  void addAppointmentDate(DateTime appointmentDate) {
    _appointmentsList[_appointmentsList.length - 1].appointmentDate =
        appointmentDate;
    _appointmentsList[_appointmentsList.length - 1].startTime =
        CustomDateFormatter.getDateTimeFromTimeString(
            appointmentDate,
            CustomDateFormatter.getTimeStringFromDateTime(
                _appointmentsList[_appointmentsList.length - 1].startTime));
    _appointmentsList[_appointmentsList.length - 1].endTime =
        CustomDateFormatter.getDateTimeFromTimeString(
            appointmentDate,
            CustomDateFormatter.getTimeStringFromDateTime(
                _appointmentsList[_appointmentsList.length - 1].endTime));

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
    app += "guests" + appointment.guests.toString() + "\n";
    app += "assets" + appointment.assets.toString() + "\n";
    print(app);
  }

  void removeLastGuest() {
    _appointmentsList[_appointmentsList.length - 1].guests.removeLast();
    notifyListeners();
  }

  //Register errors to be removed
  void removeError(String errorType) {
    newAppointmentErrors.remove(errorType);
    locationErrors.remove(errorType);
    visitorInformationErrors.remove(errorType);
    otherVisitorInformationErrors.remove(errorType);
    notifyListeners();
  }

  void newAppointmentValid() {
    var currentAppointment = _appointmentsList[_appointmentsList.length - 1];

    if (currentAppointment.appointmentType == null ||
        currentAppointment.appointmentType == "") {
      newAppointmentErrors.putIfAbsent(
          "appointmentType", () => "Please select a visitor type");
    } else {
      newAppointmentErrors.remove("appointmentType");
    }
    if (currentAppointment.officiality == null ||
        currentAppointment.officiality == "") {
      newAppointmentErrors.putIfAbsent(
          "officiality", () => "Please select an officiality type");
    } else {
      newAppointmentErrors.remove("officiality");
    }
    if (currentAppointment.staffName == null ||
        currentAppointment.staffName == "") {
      newAppointmentErrors.putIfAbsent(
          "staffName", () => "Please enter a host name");
    } else {
      newAppointmentErrors.remove("staffName");
    }
    if (currentAppointment.visitPurpose == null ||
        currentAppointment.visitPurpose == "") {
      newAppointmentErrors.putIfAbsent(
          "visitPurpose", () => "Please select purpose of visit");
    } else {
      newAppointmentErrors.remove("visitPurpose");
    }
    if (currentAppointment.startTime == null ||
        currentAppointment.startTime == "" ||
        currentAppointment.startTime.isBefore(DateTime.now()) ||
        currentAppointment.startTime.isAtSameMomentAs(DateTime.now())) {
      newAppointmentErrors.putIfAbsent("startTime", () => "Invalid start time");
    } else {
      newAppointmentErrors.remove("startTime");
    }
    if (currentAppointment.endTime == null ||
        currentAppointment.endTime == "" ||
        currentAppointment.endTime.isBefore(DateTime.now()) ||
        currentAppointment.endTime
            .isAtSameMomentAs(currentAppointment.startTime) ||
        currentAppointment.endTime.isBefore(currentAppointment.startTime)) {
      newAppointmentErrors.putIfAbsent("endTime", () => "Invalid end time");
    } else {
      newAppointmentErrors.remove("endTime");
    }

    print(newAppointmentErrors);

    notifyListeners();
  }

  void locationValid() {
    var currentAppointment = _appointmentsList[_appointmentsList.length - 1];

    if (currentAppointment.location == null ||
        currentAppointment.location == "") {
      locationErrors.putIfAbsent("location", () => "Please select a location");
    } else {
      locationErrors.remove("location");
    }
    if (currentAppointment.floorNumber == null ||
        currentAppointment.floorNumber == "") {
      locationErrors.putIfAbsent("floor", () => "Please select a floor");
    } else {
      locationErrors.remove("floor");
    }
    if (currentAppointment.rooms == null || currentAppointment.rooms.isEmpty) {
      locationErrors.putIfAbsent(
          "rooms", () => "Please select at least one room");
    } else {
      locationErrors.remove("rooms");
    }

    print(locationErrors);

    notifyListeners();
  }

  void otherGuestInformationValid() {
    var currentAppointment = _appointmentsList[_appointmentsList.length - 1];
    var currentGuests = currentAppointment.guests;
    var currentGuest = currentGuests[currentGuests.length - 1];

    if (currentGuest.email == null || currentGuest.email == "") {
      otherVisitorInformationErrors.putIfAbsent(
          "email", () => "Please enter email");
    } else {
      otherVisitorInformationErrors.remove("email");
    }

    if (!CustomStringManipulation.validatEmail(currentGuest.email)) {
      otherVisitorInformationErrors.putIfAbsent(
          "email", () => "Please enter valid email");
    } else {
      otherVisitorInformationErrors.remove("email");
    }

    if (currentGuest.phoneNumber == null || currentGuest.phoneNumber == "") {
      otherVisitorInformationErrors.putIfAbsent(
          "phoneNumber", () => "Please enter phone number");
    } else {
      otherVisitorInformationErrors.remove("firstName");
    }

    if (!CustomStringManipulation.validatEmail(currentGuest.phoneNumber)) {
      otherVisitorInformationErrors.putIfAbsent(
          "phoneNumber", () => "Please enter valid phone number");
    } else {
      otherVisitorInformationErrors.remove("phoneNumber");
    }
    print("other visitor information errors: " +
        otherVisitorInformationErrors.toString());

    notifyListeners();
  }

  void visitorInformationValid() {
    var currentAppointment = _appointmentsList[_appointmentsList.length - 1];

    if (currentAppointment.guests[0].firstName == null ||
        currentAppointment.guests[0].firstName == "") {
      visitorInformationErrors.putIfAbsent(
          "firstName", () => "Please enter first name");
    } else {
      visitorInformationErrors.remove("firstName");
    }

    if (currentAppointment.guests[0].lastName == null ||
        currentAppointment.guests[0].lastName == "") {
      visitorInformationErrors.putIfAbsent(
          "lastName", () => "Please enter last name");
    } else {
      visitorInformationErrors.remove("lastName");
    }

    if (currentAppointment.guests[0].email == null ||
        currentAppointment.guests[0].email == "") {
      visitorInformationErrors.putIfAbsent("email", () => "Please enter email");
    } else {
      visitorInformationErrors.remove("email");
    }
    if (!CustomStringManipulation.validatEmail(
        currentAppointment.guests[0].email)) {
      visitorInformationErrors.putIfAbsent(
          "email", () => "Please enter a valid email");
    } else {
      visitorInformationErrors.remove("email");
    }

    if (currentAppointment.guests[0].phoneNumber == null ||
        currentAppointment.guests[0].phoneNumber == "") {
      visitorInformationErrors.putIfAbsent(
          "phoneNumber", () => "Please enter phone number");
    } else {
      visitorInformationErrors.remove("phoneNumber");
    }

    if (!CustomStringManipulation.validatPhoneNumber(
        currentAppointment.guests[0].phoneNumber)) {
      visitorInformationErrors.putIfAbsent(
          "phoneNumber", () => "Please enter a valid phone number");
    } else {
      visitorInformationErrors.remove("phoneNumber");
    }

    if (currentAppointment.guests[0].address == null ||
        currentAppointment.guests[0].address == "") {
      visitorInformationErrors.putIfAbsent(
          "address", () => "Please enter address");
    } else {
      visitorInformationErrors.remove("address");
    }
    if (currentAppointment.assetPresent == null ||
        currentAppointment.assetPresent == "") {
      visitorInformationErrors.putIfAbsent(
          "isAssetPresent", () => "Please make a choice");
    } else {
      visitorInformationErrors.remove("isAssetPresent");
    }

    bool selected = false;
    try {
      var presenceBool = assetPresentBools.firstWhere(
          (element) => element["text"] == currentAppointment.assetPresent);
      selected = presenceBool["value"];
    } on StateError {
      selected = false;
    }

    // if (presenceBool != null) {
    //   print("presence bool ${presenceBool["value"]}");
    // }

    if (currentAppointment.assets.isEmpty && selected) {
      // print(
      //     "currently selected: ${AssetPresentBoolNotifier.getCurrentlySelectedAssetPresentBool().toString()}");
      visitorInformationErrors.putIfAbsent(
          "assets", () => "Please select one or more assets");
    } else {
      visitorInformationErrors.remove("assets");
    }

    print(visitorInformationErrors);

    notifyListeners();
  }
}
