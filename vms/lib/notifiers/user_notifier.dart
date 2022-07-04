import 'package:flutter/cupertino.dart';
import 'package:vms/data/rooms.dart';
import 'package:vms/models/room.dart';
import 'package:vms/models/user.dart';
import 'package:vms/notifiers/login_logout_notifier.dart';

class UserNotifier with ChangeNotifier {
  LoginLogoutNotifier loginLogoutNotifier = LoginLogoutNotifier();
  List<dynamic> userRoles = [];
  final GH_ROLE = "GH";

  void set setUserRoles(List<dynamic> roles) {
    userRoles = roles;
    notifyListeners();
  }

  Future<List<dynamic>> getAndSetUserRoles() async {
    Map<dynamic, dynamic> userDetails =
        await loginLogoutNotifier.getLoggedInUserDetails();
    User user = User.fromJson(userDetails as Map<String, dynamic>);
    if (user != null) {
      setUserRoles = user.roles;
      return user.roles;
    }

    return [];
  }

  Future<bool> isGH() {
    return getAndSetUserRoles().then((value) {
      try {
        var role = value.firstWhere((element) => element["name"] == GH_ROLE);
        print("returned role: " + role.toString());
        if (role != null && role.isNotEmpty) {
          return true;
        }
        return false;
      } on StateError {
        return false;
      }
    });
  }

  Future<String> getGHId() {
    return getAndSetUserRoles().then((value) {
      try {
        var role = value.firstWhere((element) => element["name"] == GH_ROLE);
        print("returned role: " + role.toString());
        if (role != null && role.isNotEmpty) {
          return role["id"];
        }
        return "";
      } on StateError {
        return "";
      }
    });
  }
}
