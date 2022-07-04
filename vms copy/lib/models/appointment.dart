import 'package:vms/models/room.dart';
import 'package:vms/models/visitor.dart';

class Appointment {
  String id;
  String staffName;
  String assetPresent;
  String location;
  String visitType;
  String appointmentType;
  DateTime startTime;
  DateTime endTime;
  DateTime appointmentDate;
  String staffImagePath;
  String appointmentStatus;
  List<dynamic> guests;
  String floorNumber;
  List<dynamic> rooms;
  List<dynamic> assets;

  Appointment({
    required this.id,
    required this.staffName,
    required this.visitType,
    required this.assetPresent,
    required this.startTime,
    required this.visitPurpose,
    required this.endTime,
    required this.appointmentType,
    required this.appointmentStatus,
    required this.staffImagePath,
    required this.appointmentDate,
    required this.floorNumber,
    required this.guests,
    required this.rooms,
    required this.assets,
    required this.location,
  });

  @override
  String toString() {
    return this.toJson().toString();
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "staffName": staffName,
      "officiality": officiality,
      "assetPresent": assetPresent,
      "startTime": startTime,
      "visitPurpose": visitPurpose,
      "endTime": endTime,
      "appointmentType": appointmentType,
      "appointmentStatus": appointmentStatus,
      "staffImagePath": staffImagePath,
      "appointmentDate": appointmentDate,
      "floorNumber": floorNumber,
      "guests": guests,
      "roomNumbers": rooms,
      "assets": assets,
      "location": location,
    };
  }

  dynamic myEncode(dynamic item) {
    if (item is DateTime) {
      return item.toIso8601String();
    }
    if (item is Visitor) {
      return item.toMap();
    }
    if (item is Room) {
      return item.toMap();
    }
    return item;
  }
}
