import 'dart:convert';

import 'package:vms/models/api_response.dart';
import 'package:vms/models/appointment.dart';
import 'package:http/http.dart' as http;

class AppointmentService {
  var url = "https://62a9e7543b314385543df388.mockapi.io/api/v1/";
  var headers = {
    "Content-Type": "application/json",
  };

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
            assetPresent: item["isAssetPresent"],
            guests: item["guests"],
            appointmentType: item["appointmentType"],
            appointmentStatus: item["appointmentStatus"],
            officiality: item["officiality"],
            endTime: DateTime.parse(item["endTime"]),
            startTime: DateTime.parse(item["startTime"]),
            location: item["location"],
            floorNumber: item["floorNumber"].toString(),
            rooms: item["roomNumbers"],
            assets: item["assets"],
            staffImagePath: item["avatar"],
            staffName: item["name"],
            appointmentDate: DateTime.parse(item["appointmentDate"]),
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
          assetPresent: jsonData["isAssetPresent"],
          visitPurpose: jsonData["visitPurpose"],
          appointmentType: jsonData["appointmentType"],
          appointmentStatus: jsonData["appointmentStatus"],
          officiality: jsonData["officiality"],
          endTime: DateTime.parse(jsonData["endTime"]),
          startTime: DateTime.parse(jsonData["startTime"]),
          location: jsonData["location"],
          floorNumber: jsonData["floorNumber"].toString(),
          rooms: jsonData["roomNumbers"],
          assets: jsonData["assets"],
          staffImagePath: jsonData["avatar"],
          staffName: jsonData["name"],
          appointmentDate: DateTime.parse(jsonData["appointmentDate"]),
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

  Future<APIResponse<Appointment>> createAppointment(Appointment appointment) {
    return http
        .post(Uri.parse("$url/appointments"),
            headers: headers,
            body: json.encode(appointment.toJson(),
                toEncodable: appointment.myEncode))
        .then((data) {
      if (data.statusCode == 201) {
        print(data.toString());

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
