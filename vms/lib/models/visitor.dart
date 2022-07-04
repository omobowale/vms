import 'package:flutter/material.dart';

class Visitor with ChangeNotifier {
  String id;
  String firstName;
  String lastName;
  String email;
  String address;
  String phoneNumber;

  Visitor(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.address,
      required this.email,
      required this.phoneNumber});

  set setId(String id) {
    id = id;
    notifyListeners();
  }

  set setFirstName(String firstName) {
    firstName = firstName;
    notifyListeners();
  }

  set setPhoneNumber(String phoneNumber) {
    phoneNumber = phoneNumber;
    notifyListeners();
  }

  set setEmail(String email) {
    email = email;
    notifyListeners();
  }

  bool isValid() {
    if (email != null &&
        email != "" &&
        phoneNumber != null &&
        phoneNumber != "") {
      return true;
    }

    return false;
  }

  @override
  String toString() {
    return "[first name: $firstName, id: $id, last name: $lastName, address: $address, email: $email, phone: $phoneNumber]";
  }

  Map<String, dynamic> toMap() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "id": id,
      "email": email,
      "address": address,
    };
  }

  static Visitor fromMap(Map<String, dynamic> visitor) {
    return Visitor(
      phoneNumber: visitor["phoneNumber"],
      address: visitor["address"],
      email: visitor["email"],
      firstName: visitor["firstName"],
      lastName: visitor["lastName"],
      id: visitor["id"],
    );
  }

  static List<Visitor> convertVisitorMapsToVisitorObjects(
      List<dynamic> visitors) {
    Iterable<Visitor> v = visitors.map((visitor) {
      if (visitor is Map<String, dynamic>) {
        return fromMap(visitor);
      }
      return visitor;
    });

    return v.toList();
  }
}
