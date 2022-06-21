import 'package:flutter/material.dart';
import 'package:vms/custom_widgets/custom_input_field.dart';

class VisitorAddress extends StatelessWidget {
  const VisitorAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Column(
        children: [
          CustomInputField(
            bordered: false,
            hintText: "Enter visitor address",
            labelText: "Enter visitor address",
            minLines: 3,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
