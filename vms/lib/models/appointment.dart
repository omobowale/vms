class Appointment {
  String id;
  String staffName;
  String location;
  String officiality;
  String appointmentType;
  DateTime startTime;
  DateTime endTime;
  DateTime appointmentDate;
  String staffImagePath;
  String approvalStatus;
  String visitPurpose;
  List<dynamic> guests;
  String floorNumber;
  List<dynamic> rooms;

  Appointment({
    required this.id,
    required this.staffName,
    required this.officiality,
    required this.startTime,
    required this.visitPurpose,
    required this.endTime,
    required this.appointmentType,
    required this.approvalStatus,
    required this.staffImagePath,
    required this.appointmentDate,
    required this.floorNumber,
    required this.guests,
    required this.rooms,
    required this.location,
  });
}
