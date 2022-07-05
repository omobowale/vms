import 'dart:convert';

import 'package:vms/models/api_response.dart';
import 'package:vms/models/appointment.dart';
import 'package:http/http.dart' as http;
import 'package:vms/models/group_head.dart';
import 'package:vms/models/room.dart';
import 'package:vms/models/user.dart';
import 'package:vms/models/visitor.dart';

class LoginService {
  var url = "https://62a9e7543b314385543df388.mockapi.io/api/v1/";
  var headers = {
    "Content-Type": "application/json",
  };

  Future<APIResponse<User>> login(id) {
    return http.get(Uri.parse("$url/users/$id")).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        var user = User(
          id: jsonData["id"],
          email: jsonData["email"],
          password: jsonData["password"],
          roles: jsonData["roles"],
          username: jsonData["username"],
        );

        return APIResponse<User>(data: user, error: false);
      }
      return APIResponse<User>(
          serverError: true, errorMessage: "No user found");
    }).catchError((error) {
      print("error here: " + error.toString());
      return APIResponse<Appointment>(
          serverError: true, errorMessage: "Error fetching user");
    });
  }
}
