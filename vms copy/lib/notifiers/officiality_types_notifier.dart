import 'package:flutter/cupertino.dart';
import 'package:vms/data/officiality_types.dart';
import 'package:vms/models/officiality_type.dart';

class OfficialityTypeNotifier with ChangeNotifier {
  List<OfficialityType> get allOfficialityTypes {
    return createOfficialityTypesFromData(officialityTypes);
  }

  List<OfficialityType> createOfficialityTypesFromData(List<dynamic> officialityTypes) {
    int count = 0;
    List<OfficialityType> allOfficialitytypes = officialityTypes.map((officialityType) {
      return OfficialityType(id: (++count).toString(), type: officialityType);
    }).toList();

    return allOfficialitytypes;
  }
}


