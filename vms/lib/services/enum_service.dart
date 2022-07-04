import 'dart:convert';

import 'package:vms/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:vms/models/enumeration.dart';

class EnumService {
  var url = "https://62a9e7543b314385543df388.mockapi.io/api/v1/";
  var headers = {
    "Content-Type": "application/json",
  };

  Future<APIResponse<List<Enumeration>>> getEnumerations() {
    return http.get(Uri.parse("$url/enums")).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print("json data: " + jsonData.toString());
        final List<Enumeration> enumerations = [];
        for (var item in jsonData) {
          print("item data: " + item.toString());
          print("item enums: " + item["enums"].toString());
          var enumeration = Enumeration(
            enums: item["enums"],
          );
          enumerations.add(enumeration);
        }

        print("enums ${enumerations}");

        return APIResponse<List<Enumeration>>(data: enumerations);
      }
      return APIResponse<List<Enumeration>>(
          error: true, errorMessage: "Error fetching enumerations");
    }).catchError((error) {
      print("error here: " + error.toString());
      return APIResponse<List<Enumeration>>(
          error: true, errorMessage: "Error fetching enumerations");
    });
  }
}
