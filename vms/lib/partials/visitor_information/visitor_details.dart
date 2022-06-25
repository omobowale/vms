import 'package:flutter/material.dart';
import 'package:vms/custom_widgets/custom_input_field.dart';

class VisitorDetails extends StatefulWidget {
  const VisitorDetails({Key? key}) : super(key: key);

  @override
  State<VisitorDetails> createState() => _VisitorDetailsState();
}

class _VisitorDetailsState extends State<VisitorDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(
                flex: 10,
                child: CustomInputField(
                  onComplete: () {},
                  bordered: false,
                  hintText: "First name",
                  labelText: "First name",
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 10,
                child: CustomInputField(
                  onComplete: () {},
                  bordered: false,
                  hintText: "Last name",
                  labelText: "Last name",
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: CustomInputField(
            onComplete: () {},
            bordered: false,
            hintText: "Phone Number",
            labelText: "Phone Number",
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: CustomInputField(
            onComplete: () {},
            bordered: false,
            hintText: "Email",
            labelText: "Email",
          ),
        ),
      ]),
    );
  }
}
