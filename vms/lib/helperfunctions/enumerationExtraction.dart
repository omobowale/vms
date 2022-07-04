import 'package:get_it/get_it.dart';
import 'package:vms/services/enum_service.dart';

EnumService get service => GetIt.I<EnumService>();

List<Map<String, dynamic>> extractFromEnumeration(
    Map<String, dynamic> enumeration) {
  List<Map<String, dynamic>> enumList = [];
  enumeration.forEach((key, value) {
    enumList.add({"id": key, "name": value});
  });

  return enumList;
}

Future<List<Map<String, dynamic>>> getAndSetEnumeration(String enumType) {
  return service.getEnumerations().then((response) {
    var x = response.data![0].enums[enumType];

    var typeList = extractFromEnumeration(x);

    return typeList;
  });
}
