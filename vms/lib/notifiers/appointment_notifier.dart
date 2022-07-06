import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vms/data/appointment_statuses.dart';
import 'package:vms/data/floors.dart';
import 'package:vms/data/group_heads.dart';
import 'package:vms/data/locations.dart';
import 'package:vms/data/time_selection.dart';
import 'package:vms/data/visit_types.dart';
import 'package:vms/helperfunctions/custom_date_formatter.dart';
import 'package:vms/helperfunctions/custom_string_manipulations.dart';
import 'package:vms/helperfunctions/modify_appointment.dart';
import 'package:vms/models/group_head.dart';
import 'package:vms/models/host.dart';
import 'package:vms/models/room.dart';
import 'package:vms/models/appointment.dart';
import 'package:vms/models/user.dart';
import 'package:vms/models/visitor.dart';
import 'package:vms/notifiers/user_notifier.dart';

class AppointmentNotifier with ChangeNotifier {
  List<Appointment> _appointmentsList = [];

  bool _completed = false;
  bool _isCreating = false;
  bool _isEditing = false;

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

  bool get isCreating => _isCreating;
  bool get isEditing => _isEditing;

  void set setIsCreating(bool isCreating) {
    //remove all errors
    removeAllErrors();
    _isCreating = isCreating;
  }

  void set setIsEditing(bool isEditing) {
    //remove all errors
    removeAllErrors();
    _isEditing = isEditing;
  }

  void removeAllErrors() {
    newAppointmentErrors = {};
    locationErrors = {};
    visitorInformationErrors = {};
    otherVisitorInformationErrors = {};
  }

  void set completed(bool completed) {
    _completed = completed;
    notifyListeners();
  }

  void resetAppointmentList() {
    _appointmentsList.clear();
  }

  void loadSelectedAppointment(Appointment? appointment) {
    print("loaded appointment" + appointment.toString());

    setIsEditing = true;
    setIsCreating = false;
    if (appointment != null) {
      resetAppointmentList();
      print("is editing " + isEditing.toString());
      _appointmentsList.add(appointment);
      showAppointment(appointment);
      notifyListeners();
    }
  }

  void addEmptyAppointment() {
    print("is creating " + isCreating.toString());

    if (!isCreating) {
      resetAppointmentList();
      Visitor newVisitor = Visitor(
        id: "1",
        firstName: "",
        lastName: "",
        address: "",
        email: "",
        phoneNumber: "",
      );
      _appointmentsList.add(
        new Appointment(
          id: "",
          host: Host(
            id: "",
            username: "",
            email: "",
          ),
          visitType: "",
          startTime: CustomDateFormatter.getDateTimeFromTimeString(
              DateTime.now(), timesSelection[0]),
          endTime: CustomDateFormatter.getDateTimeFromTimeString(
              DateTime.now(), timesSelection[1]),
          appointmentType: "",
          appointmentStatus: 0, //appointmentStatuses[0]["value"],
          appointmentDate: DateTime.now(),
          floorNumber: floors[0],
          guests: [newVisitor],
          rooms: [],
          meetingRoom: "",
          location: "",
          groupHead: GroupHead(
            email: "",
            fullName: "",
            id: "",
            staffId: "",
          ),
          purposeOfReschedule: "",
          purposeOfCancel: "",
        ),
      );
      setIsCreating = true;
    }
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

  void addVisitorType(String visitorType) {
    _appointmentsList[_appointmentsList.length - 1].appointmentType =
        visitorType;
    notifyListeners();
  }

  void addGroupHead(GroupHead groupHead) {
    _appointmentsList[_appointmentsList.length - 1].groupHead = groupHead;
    notifyListeners();
  }

  void addVisitType(String visitType) {
    _appointmentsList[_appointmentsList.length - 1].visitType = visitType;
    notifyListeners();
  }

  void addHost(Host host) {
    _appointmentsList[_appointmentsList.length - 1].host = host;
    notifyListeners();
  }

  void addMeetingRoom(String meetingRoom) {
    _appointmentsList[_appointmentsList.length - 1].meetingRoom = meetingRoom;
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

  void addRooms(List<dynamic> rooms) {
    _appointmentsList[_appointmentsList.length - 1].rooms = rooms;
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

  void addPurposeOfReschedule(String purposeOfReschedule) {
    _appointmentsList[_appointmentsList.length - 1].purposeOfReschedule =
        purposeOfReschedule;
    notifyListeners();
  }

  void addPurposeOfCancel(String purposeOfCancel) {
    _appointmentsList[_appointmentsList.length - 1].purposeOfCancel =
        purposeOfCancel;
    notifyListeners();
  }

  void showAppointment(Appointment appointment) {
    var app = "";
    app += "appointment id: " + appointment.id.toString() + "\n";
    app += "appointment date: " + appointment.appointmentDate.toString() + "\n";
    app += "room : " + appointment.rooms.toString() + "\n";
    app += "host: " + appointment.host.toString() + "\n";
    app += "visit type: " + appointment.visitType.toString() + "\n";
    app += "end time: " + appointment.endTime.toString() + "\n";
    app += "start time: " + appointment.startTime.toString() + "\n";
    app += "visitType: " + appointment.visitType.toString() + "\n";
    app += "appointment type: " + appointment.appointmentType.toString() + "\n";
    app += "reschedule reason: " +
        appointment.purposeOfReschedule.toString() +
        "\n";
    app += "cancel reason: " + appointment.purposeOfCancel.toString() + "\n";
    app += "location" + appointment.location.toString() + "\n";
    app += "floor" + appointment.floorNumber.toString() + "\n";
    app += "guests" + appointment.guests.toString() + "\n";
    app += "group head" + appointment.host.toString() + "\n";

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

  bool dateDayIsInValid(DateTime date) {
    if (date != null && date != "") {
      if (DateFormat('EEEE').format(date).toString().toLowerCase() ==
              "sunday" ||
          DateFormat('EEEE').format(date).toString().toLowerCase() ==
              "saturday") {
        return true;
      }
      return false;
    }
    return false;
  }

  void isAppointmentDateValid(DateTime appointmentDate) {
    if (appointmentDate == null ||
        appointmentDate == "" ||
        dateDayIsInValid(appointmentDate)) {
      print("appointment date: " + appointmentDate.toString());
      newAppointmentErrors.putIfAbsent(
          "appointmentDate", () => "Please select a valid date");
    } else {
      newAppointmentErrors.remove("appointmentDate");
    }
  }

  void isVisitorTypeValid(String appointmentType) {
    if (appointmentType == null || appointmentType == "") {
      newAppointmentErrors.putIfAbsent(
          "appointmentType", () => "Please select a visitor type");
    } else {
      newAppointmentErrors.remove("appointmentType");
    }
  }

  void isVisitTypeValid(String visitType) {
    if (visitType == null || visitType == "") {
      newAppointmentErrors.putIfAbsent(
          "visitType", () => "Please select a visit type");
    } else {
      newAppointmentErrors.remove("visitType");
    }
  }

  void isHostValid(Host host) {
    if (!host.isValid()) {
      newAppointmentErrors.putIfAbsent("host", () => "Please select a host");
    } else {
      newAppointmentErrors.remove("host");
    }
  }

  void isStartTimeValid(DateTime startTime) {
    if (startTime == null ||
        startTime == "" ||
        startTime.isBefore(DateTime.now()) ||
        startTime.isAtSameMomentAs(DateTime.now())) {
      newAppointmentErrors.putIfAbsent("startTime", () => "Invalid start time");
    } else {
      newAppointmentErrors.remove("startTime");
    }
  }

  void isEndTimeValid(DateTime endTime, DateTime startTime) {
    if (endTime == null ||
        endTime == "" ||
        endTime.isBefore(DateTime.now()) ||
        endTime.isAtSameMomentAs(startTime) ||
        endTime.isBefore(startTime)) {
      newAppointmentErrors.putIfAbsent("endTime", () => "Invalid end time");
    } else {
      newAppointmentErrors.remove("endTime");
    }
  }

  void newAppointmentValid() {
    var currentAppointment = _appointmentsList[_appointmentsList.length - 1];

    isVisitorTypeValid(currentAppointment.appointmentType);
    isAppointmentDateValid(currentAppointment.appointmentDate);
    isVisitTypeValid(currentAppointment.visitType);
    isHostValid(currentAppointment.host);
    isStartTimeValid(currentAppointment.startTime);
    isEndTimeValid(currentAppointment.endTime, currentAppointment.startTime);

    print(newAppointmentErrors);

    notifyListeners();
  }

  void isLocationValid(String location) {
    if (location == null || location == "") {
      locationErrors.putIfAbsent("location", () => "Please select a location");
    } else {
      locationErrors.remove("location");
    }
  }

  void isFloorNumberValid(String floorNumber) {
    if (floorNumber == null || floorNumber == "") {
      locationErrors.putIfAbsent("floor", () => "Please select a floor");
    } else {
      locationErrors.remove("floor");
    }
  }

  void isMeetingRoomValid(String meetingRoom) {
    if (meetingRoom == null || meetingRoom == "") {
      locationErrors.putIfAbsent("meetingRoom", () => "Please enter a room");
    } else {
      locationErrors.remove("meetingRoom");
    }
  }

  void locationValid() {
    var currentAppointment = _appointmentsList[_appointmentsList.length - 1];

    isLocationValid(currentAppointment.location);
    isFloorNumberValid(currentAppointment.floorNumber);
    isMeetingRoomValid(currentAppointment.meetingRoom);

    print(locationErrors);

    notifyListeners();
  }

  void isGuestEmailValid(String email, Map<String, String> errorsType) {
    if (email == null || email == "") {
      errorsType.putIfAbsent("email", () => "Please enter email");
    } else {
      errorsType.remove("email");
    }
    if (!CustomStringManipulation.validatEmail(email)) {
      errorsType.putIfAbsent("email", () => "Please enter valid email");
    } else {
      errorsType.remove("email");
    }
  }

  void isGuestPhoneNumberValid(
      String phoneNumber, Map<String, String> errorsType) {
    if (phoneNumber == null || phoneNumber == "") {
      errorsType.putIfAbsent("phoneNumber", () => "Please enter phone number");
    } else {
      errorsType.remove("phoneNumber");
    }
    if (!CustomStringManipulation.validatPhoneNumber(phoneNumber)) {
      errorsType.putIfAbsent(
          "phoneNumber", () => "Please enter valid phone number");
    } else {
      errorsType.remove("phoneNumber");
    }
  }

  void isGuestAddressValid(String address, Map<String, String> errorsType) {
    if (address == null || address == "") {
      errorsType.putIfAbsent("address", () => "Please enter address");
    } else {
      errorsType.remove("address");
    }
  }

  void isGuestFirstNameValid(String firstName, Map<String, String> errorsType) {
    if (firstName == null || firstName == "") {
      visitorInformationErrors.putIfAbsent(
          "firstName", () => "Please enter first name");
    } else {
      visitorInformationErrors.remove("firstName");
    }
  }

  void isGuestLastNameValid(String lastName, Map<String, String> errorsType) {
    if (lastName == null || lastName == "") {
      visitorInformationErrors.putIfAbsent(
          "lastName", () => "Please enter last name");
    } else {
      visitorInformationErrors.remove("lastName");
    }
  }

  void otherGuestInformationValid() {
    var currentAppointment = _appointmentsList[_appointmentsList.length - 1];
    var currentGuests = currentAppointment.guests;
    var currentGuest = currentGuests[currentGuests.length - 1];

    isGuestEmailValid(currentGuest.email, otherVisitorInformationErrors);

    isGuestPhoneNumberValid(
        currentGuest.phoneNumber, otherVisitorInformationErrors);

    print("other visitor information errors: " +
        otherVisitorInformationErrors.toString());

    notifyListeners();
  }

  void visitorInformationValid() {
    var currentAppointment = _appointmentsList[_appointmentsList.length - 1];

    isGuestFirstNameValid(
        currentAppointment.guests[0].firstName, visitorInformationErrors);
    isGuestLastNameValid(
        currentAppointment.guests[0].lastName, visitorInformationErrors);
    isGuestEmailValid(
        currentAppointment.guests[0].email, visitorInformationErrors);
    isGuestPhoneNumberValid(
        currentAppointment.guests[0].phoneNumber, visitorInformationErrors);

    isGuestAddressValid(
        currentAppointment.guests[0].address, visitorInformationErrors);

    print(visitorInformationErrors);

    notifyListeners();
  }

  void isPurposeOfCancelValid(
      String purposeOfCancel, Map<String, String> errorsType) {
    if (purposeOfCancel == null || purposeOfCancel == "") {
      errorsType.putIfAbsent(
          "purposeOfCancel", () => "Please select/input a purpose of cancel");
    } else {
      errorsType.remove("purposeOfCancel");
    }
  }

  void isCancelValid() {
    var currentAppointment = _appointmentsList[_appointmentsList.length - 1];
    isPurposeOfCancelValid(
        currentAppointment.purposeOfCancel ?? "", newAppointmentErrors);
    notifyListeners();
  }

  void isRescheduleValid() {
    var currentAppointment = _appointmentsList[_appointmentsList.length - 1];
    isAppointmentDateValid(currentAppointment.appointmentDate);
    isStartTimeValid(currentAppointment.startTime);
    isEndTimeValid(currentAppointment.endTime, currentAppointment.startTime);
    notifyListeners();
  }

  static List<Appointment> getPendingAppointmentRequests(
      List<Appointment> appointmentRequests) {
    try {
      var ar = appointmentRequests
          .where((element) => element.appointmentStatus == PENDING)
          .toList();
      print("ar: ${ar}");
      return ar;
    } on StateError {
      return [];
    }
  }

  // static Future<bool> belongsToGH(String id) {
  //   UserNotifier _userNotifier = UserNotifier();
  //   return _userNotifier.getGHId().then((value) => id == value);
  // }

  static int getAppointmentStatusFromName(
      String name, List<Map<String, dynamic>> statuses) {
    try {
      var as = statuses.firstWhere((element) {
        return element["name"].toLowerCase() == name.toLowerCase();
      });
      return as["value"];
    } on StateError {
      return 0;
    }
  }

  static List<Appointment> fetchAppointmentForDay(
      List<Appointment> appointments, DateTime selectedDate) {
    String selectedDateString =
        CustomDateFormatter.getFormatedDate(selectedDate);
    try {
      var ar = appointments
          .where((element) =>
              CustomDateFormatter.getFormatedDate(element.appointmentDate) ==
              selectedDateString)
          .toList();
      return ar;
    } on StateError {
      return [];
    }
  }

  static List<DateTime> getMarkedDates(List<Appointment> appointments) {
    try {
      var md = appointments.map((element) => element.appointmentDate).toList();
      return md;
    } on StateError {
      return [];
    }
  }
}
