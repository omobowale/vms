import 'package:flutter/material.dart';
import 'package:vms/models/module.dart';
import 'package:vms/views/view.dart';

var modules = [
  Module(
    id: "1",
    moduleIconPath: "assets/images/vms_module_icon.png",
    moduleName: "Visitor Management",
    onTap: (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => View()));
    },
  ),
  Module(
      id: "2",
      moduleIconPath: "assets/images/cms_module_icon.png",
      moduleName: "Canteen Management",
      onTap: (context) {}),
  Module(
      id: "3",
      moduleIconPath: "assets/images/cos_module_icon.png",
      moduleName: "Car Ordering",
      onTap: (context) {}),
];
