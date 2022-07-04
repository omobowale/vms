import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vms/data/assets.dart';
import 'package:vms/models/asset.dart';
import 'package:vms/models/user.dart';

class LoginLogoutNotifier with ChangeNotifier {
  bool _isLoggedIn = false;

  void setIsLoggedIn(bool b) {
    _isLoggedIn = b;
    notifyListeners();
  }

  bool get isLoggedIn => _isLoggedIn;

  Future<void> logUserIn(User user) async {
    if (user != null) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String userString = jsonEncode(user.toJson());
      pref.setString('userData', userString);
      setIsLoggedIn(true);

      print("User is logged in now [${isLoggedIn}]! $userString");
    }
    notifyListeners();
  }

  Future<void> logUserOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString('userData', '');

    setIsLoggedIn(false);

    notifyListeners();
  }

  Future<Map> getLoggedInUserDetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userPref = pref.getString('userData');

    if (userPref != null && userPref != "") {
      Map<String, dynamic> userMap =
          jsonDecode(userPref) as Map<String, dynamic>;
      return userMap;
    }

    return {};
  }
}
