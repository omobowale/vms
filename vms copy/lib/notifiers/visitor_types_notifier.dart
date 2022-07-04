import 'package:flutter/cupertino.dart';
import 'package:vms/data/visitor_types.dart';
import 'package:vms/models/visitor_type.dart';

class VisitorTypeNotifier with ChangeNotifier {
  List<VisitorType> get allVisitorTypes {
    return createVisitorTypesFromData(visitorTypes);
  }

  List<VisitorType> createVisitorTypesFromData(List<dynamic> visitorTypes) {
    int count = 0;
    List<VisitorType> allvisitortypes = visitorTypes.map((visitorType) {
      return VisitorType(id: (++count).toString(), type: visitorType);
    }).toList();

    return allvisitortypes;
  }
}
