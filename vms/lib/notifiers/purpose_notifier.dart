import 'package:flutter/cupertino.dart';
import 'package:vms/data/purposes_of_visit.dart';

class PurposeNotifier with ChangeNotifier {
  List<String> purposesList = purposesOfVisit;

  List<String> get purposes => [...purposesList];
}
