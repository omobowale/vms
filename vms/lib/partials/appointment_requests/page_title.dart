import 'package:flutter/material.dart';
import 'package:vms/partials/common/top.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TopSection(
        leftText: "Appointment Requests",
        showButton: false,
        rightText: "",
      ),
    );
  }
}
