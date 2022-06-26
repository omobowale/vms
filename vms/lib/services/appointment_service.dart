import 'dart:convert';

import 'package:vms/models/api_response.dart';
import 'package:vms/models/appointment.dart';
import 'package:http/http.dart' as http;

class AppointmentService {
  var url = "https://62a9e7543b314385543df388.mockapi.io/api/v1/";

  Future<APIResponse<List<Appointment>>> getAppointments() {
    return http.get(Uri.parse("$url/appointments")).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        //convert into list of appointments
        final List<Appointment> appointments = [];
        for (var item in jsonData) {
          var appointment = Appointment(
            id: item["id"],
            visitPurpose: item["visitPurpose"],
            guests: item["guests"],
            appointmentType: item["appointmentType"],
            approvalStatus: item["approvalStatus"],
            officiality: item["officiality"],
            endTime: DateTime.fromMicrosecondsSinceEpoch(item["endTime"]),
            startTime: DateTime.fromMicrosecondsSinceEpoch(item["startTime"]),
            location: item["location"],
            floorNumber: item["floorNumber"].toString(),
            rooms: item["roomNumbers"],
            staffImagePath: item["avatar"],
            staffName: item["name"],
            appointmentDate:
                DateTime.fromMicrosecondsSinceEpoch(item["appointmentDate"]),
          );
          appointments.add(appointment);
        }
        return APIResponse<List<Appointment>>(data: appointments);
      }
      return APIResponse<List<Appointment>>(
          error: true, errorMessage: "Error fetching appointments");
    }).catchError((error) {
      print(error);
      return APIResponse<List<Appointment>>(
          error: true, errorMessage: "Error fetching appointments");
    });
  }

  Future<APIResponse<Appointment>> getAppointment(appointmentId) {
    return http.get(Uri.parse("$url/appointments/$appointmentId")).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        var appointment = Appointment(
          id: jsonData["id"],
          guests: jsonData["guests"],
          visitPurpose: jsonData["visitPurpose"],
          appointmentType: jsonData["appointmentType"],
          approvalStatus: jsonData["approvalStatus"],
          officiality: jsonData["officiality"],
          endTime: DateTime.fromMicrosecondsSinceEpoch(jsonData["endTime"]),
          startTime: DateTime.fromMicrosecondsSinceEpoch(jsonData["startTime"]),
          location: jsonData["location"],
          floorNumber: jsonData["floorNumber"].toString(),
          rooms: jsonData["roomNumbers"],
          staffImagePath: jsonData["avatar"],
          staffName: jsonData["name"],
          appointmentDate:
              DateTime.fromMicrosecondsSinceEpoch(jsonData["appointmentDate"]),
        );

        return APIResponse<Appointment>(data: appointment);
      }
      return APIResponse<Appointment>(
          error: true, errorMessage: "Error fetching appointment");
    }).catchError((error) {
      return APIResponse<Appointment>(
          error: true, errorMessage: "Error fetching appointment");
    });
  }
}
