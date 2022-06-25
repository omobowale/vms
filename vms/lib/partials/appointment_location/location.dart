import 'package:flutter/material.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';

class Location extends StatelessWidget {
  final String labelText;
  final List<String> listItems;

  const Location({Key? key, required this.labelText, required this.listItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: CustomDropDown(
        text: labelText,
        lists: listItems,
       
      ),
    );
  }
}
