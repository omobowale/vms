import 'package:flutter/material.dart';
import 'package:vms/views/maker/summary.dart';
import 'package:vms/partials/common/bottom_fixed_section.dart';
import 'package:vms/partials/common/top.dart';
import 'package:vms/partials/visitor_information/asset_check_section.dart';
import 'package:vms/partials/visitor_information/asset_information.dart';
import 'package:vms/partials/visitor_information/visitor_address.dart';
import 'package:vms/partials/visitor_information/visitor_details.dart';
import 'package:vms/partials/visitor_information/visitor_document_attachment.dart';
import 'package:vms/views/maker/appointment_location.dart';

class VisitorInformation extends StatefulWidget {
  const VisitorInformation({Key? key}) : super(key: key);

  @override
  State<VisitorInformation> createState() => _VisitorInformationState();
}

class _VisitorInformationState extends State<VisitorInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          TopSection(
            leftText: "Visitor Information",
            rightText: "Cancel",
          ),
          Divider(),
          VisitorDetails(),
          Divider(),
          VisitorAddress(),
          Divider(),
          VisitorDocumentAttachment(),
          Divider(),
          AssetCheckSection(),
          Divider(),
          AssetInformation(),
          Divider(),
          BottomFixedSection(
              leftText: "Back",
              rightText: "Continue",
              fnOne: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AppointmentLocation()));
              },
              fnTwo: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Summary()));
              }),
        ],
      ),
    );
  }
}
