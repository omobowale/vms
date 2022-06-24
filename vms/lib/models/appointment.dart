class Appointment {
  String id;
  String staffName;
  String officiality;
  String appointmentType;
  DateTime startTime;
  DateTime endTime;
  DateTime appointmentDate;
  String staffImagePath;
  String approvalStatus;
  List<dynamic> guests;
  int floorNumber;
  List<dynamic> roomNumbers;

  Appointment({
    required this.id,
    required this.staffName,
    required this.officiality,
    required this.startTime,
    required this.endTime,
    required this.appointmentType,
    required this.approvalStatus,
    required this.staffImagePath,
    required this.appointmentDate,
    required this.floorNumber,
    required this.guests,
    required this.roomNumbers,
  });
}
