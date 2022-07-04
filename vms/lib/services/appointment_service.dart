import 'dart:convert';

import 'package:vms/models/api_response.dart';
import 'package:vms/models/appointment.dart';
import 'package:http/http.dart' as http;
import 'package:vms/models/group_head.dart';
import 'package:vms/models/host.dart';
import 'package:vms/models/room.dart';
import 'package:vms/models/visitor.dart';

class AppointmentService {
  var url = "https://62a9e7543b314385543df388.mockapi.io/api/v1/";
  var headers = {
    "Content-Type": "application/json",
  };

  Future<APIResponse<List<Appointment>>> getAppointments() {
    return http.get(Uri.parse("$url/appointments")).then((data) {
      print("getting here ooooo");
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        //convert into list of appointments
        final List<Appointment> appointments = [];
        for (var item in jsonData) {
          print("item is : ${item}");
          var appointment = Appointment(
            id: item["id"],
            host: Host.fromMap(item["host"]),
            groupHead: GroupHead.fromMap(item["groupHead"]),
            purposeOfReschedule: item["purposeOfReschedule"],
            guests: Visitor.convertVisitorMapsToVisitorObjects(item["guests"]),
            appointmentType: item["appointmentType"],
            appointmentStatus: item["appointmentStatus"],
            visitType: item["visitType"],
            endTime: DateTime.parse(item["endTime"]),
            startTime: DateTime.parse(item["startTime"]),
            location: item["location"],
            floorNumber: item["floorNumber"],
            meetingRoom: item["meetingRoom"],
            rooms: Room.convertRoomMapsToRoomObjects(item["roomNumbers"]),
            appointmentDate: DateTime.parse(item["appointmentDate"]),
          );
          appointments.add(appointment);
        }
        print("data here => ${appointments.toString()}");
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
          guests:
              Visitor.convertVisitorMapsToVisitorObjects(jsonData["guests"]),
          groupHead: GroupHead.fromMap(jsonData["groupHead"]),
          purposeOfReschedule: jsonData["purposeOfReschedule"],
          appointmentType: jsonData["appointmentType"],
          appointmentStatus: jsonData["appointmentStatus"],
          visitType: jsonData["visitType"],
          endTime: DateTime.parse(jsonData["endTime"]),
          startTime: DateTime.parse(jsonData["startTime"]),
          location: jsonData["location"],
          floorNumber: jsonData["floorNumber"].toString(),
          meetingRoom: jsonData["meetingRoom"],
          rooms: Room.convertRoomMapsToRoomObjects(jsonData["roomNumbers"]),
          host: Host.fromMap(jsonData["host"]),
          appointmentDate: DateTime.parse(jsonData["appointmentDate"]),
        );
        print("single data here => ${appointment.toString()}");
        return APIResponse<Appointment>(data: appointment);
      }
      return APIResponse<Appointment>(
          error: true, errorMessage: "Error fetching appointment");
    }).catchError((error) {
      print("error here: " + error.toString());
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

        return APIResponse<Appointment>(data: appointment, error: null);
      }
      return APIResponse<Appointment>(
          error: true, errorMessage: "Error fetching appointment");
    }).catchError((error) {
      return APIResponse<Appointment>(
          error: true, errorMessage: "Error fetching appointment");
    });
  }

  Future<APIResponse<Appointment>> updateAppointment(
      Appointment appointment, String appointmentId) {
    return http
        .put(Uri.parse("$url/appointments/$appointmentId"),
            headers: headers,
            body: json.encode(appointment.toJson(),
                toEncodable: appointment.myEncode))
        .then((data) {
      print("data status code" + data.statusCode.toString());
      if (data.statusCode == 200) {
        print(data.toString());
        final jsonData = json.decode(data.body);
        print("update json data" + jsonData.toString());
        var appointment = Appointment(
          id: jsonData["id"],
          guests:
              Visitor.convertVisitorMapsToVisitorObjects(jsonData["guests"]),
          groupHead: GroupHead.fromMap(jsonData["groupHead"]),
          purposeOfReschedule: jsonData["purposeOfReschedule"],
          appointmentType: jsonData["appointmentType"],
          appointmentStatus: jsonData["appointmentStatus"],
          visitType: jsonData["visitType"],
          endTime: DateTime.parse(jsonData["endTime"]),
          startTime: DateTime.parse(jsonData["startTime"]),
          location: jsonData["location"],
          floorNumber: jsonData["floorNumber"].toString(),
          meetingRoom: jsonData["meetingRoom"],
          rooms: Room.convertRoomMapsToRoomObjects(jsonData["roomNumbers"]),
          host: Host.fromMap(jsonData["host"]),
          appointmentDate: DateTime.parse(jsonData["appointmentDate"]),
        );

        return APIResponse<Appointment>(data: appointment, error: null);
      }

      return APIResponse<Appointment>(
          error: true, errorMessage: "Error fetching appointment");
    }).catchError((error) {
      print("error here update: " + error.toString());
      return APIResponse<Appointment>(
          error: true, errorMessage: "Error fetching appointment");
    });
  }
}
