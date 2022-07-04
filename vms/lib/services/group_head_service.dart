import 'dart:convert';

import 'package:vms/models/api_response.dart';
import 'package:vms/models/appointment.dart';
import 'package:http/http.dart' as http;
import 'package:vms/models/group_head.dart';
import 'package:vms/models/room.dart';
import 'package:vms/models/user.dart';
import 'package:vms/models/visitor.dart';

class GroupHeadService {
  var url = "https://62a9e7543b314385543df388.mockapi.io/api/v1/";
  var headers = {
    "Content-Type": "application/json",
  };

  Future<APIResponse<List<GroupHead>>> getGroupHeads() {
    print("i got here");
    return http.get(Uri.parse("$url/groupHeads")).then((data) {
      print(data.statusCode);
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        //convert into list of appointments
        final List<GroupHead> groupHeads = [];
        for (var item in jsonData) {
          print("item is : ${item}");
          var groupHead = GroupHead(
            staffId: item["staffId"],
            id: item["id"],
            fullName: item["fullName"],
            email: item["email"],
          );
          groupHeads.add(groupHead);
        }
        print("group head data here => ${groupHeads.toString()}");
        return APIResponse<List<GroupHead>>(data: groupHeads);
      }
      return APIResponse<List<GroupHead>>(
          error: true, errorMessage: "Error fetching group heads");
    }).catchError((error) {
      print(error);
      return APIResponse<List<GroupHead>>(
          error: true, errorMessage: "Error fetching group heads");
    });
  }
}
