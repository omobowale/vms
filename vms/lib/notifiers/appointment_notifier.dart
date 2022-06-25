import 'package:flutter/material.dart';
import 'package:vms/models/appointment.dart';

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
    _appointmentsList.add(
      new Appointment(
        id: _appointmentsList.length.toString(),
        staffName: "",
        officiality: "",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        appointmentType: "",
        approvalStatus: "",
        staffImagePath: "",
        appointmentDate: DateTime.now(),
        floorNumber: 0,
        guests: [],
        roomNumbers: [],
      ),
    );
    notifyListeners();
  }

  void addGuests(List<dynamic> guests) {
    _appointmentsList[_appointmentsList.length - 1].guests = guests;
    notifyListeners();
  }

  void addVisitorType(String visitorType) {
    _appointmentsList[_appointmentsList.length - 1].appointmentType = visitorType;
    notifyListeners();
  }

  void addHostName(String hostName) {
    _appointmentsList[_appointmentsList.length - 1].staffName = hostName;
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
    _appointmentsList[_appointmentsList.length - 1].appointmentDate = appointmentDate;
    notifyListeners();
  }

  void addRoomNumbers(List<dynamic> roomNumbers) {
    _appointmentsList[_appointmentsList.length - 1].roomNumbers = roomNumbers;
    notifyListeners();
  }

  void addAppointment(Appointment appointment) {
    _appointmentsList.add(appointment);
    notifyListeners();
  }
}
