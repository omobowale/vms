import 'package:flutter/material.dart';

class GroupHead with ChangeNotifier {
  String id;
  String fullName;
  String email;
  String staffId;

  GroupHead({
    required this.id,
    required this.staffId,
    required this.fullName,
    required this.email,
  });

  factory GroupHead.emptyOne() {
    return GroupHead(id: "", staffId: "", fullName: "", email: "");
  }

  @override
  String toString() {
    return "[full name: $fullName, id: $id,  email: $email]";
  }

  Map<String, dynamic> toMap() {
    return {
      "fullName": fullName,
      "id": id,
      "email": email,
      "staffId": staffId,
    };
  }

  static GroupHead fromMap(Map<String, dynamic> groupHead) {
    print("Group head " + groupHead.toString());
    return GroupHead(
      email: groupHead["email"],
      fullName: groupHead["fullName"],
      id: groupHead["id"],
      staffId: groupHead["staffId"],
    );
  }
}
