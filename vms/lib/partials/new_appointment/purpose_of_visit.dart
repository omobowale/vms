import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';

class VisitPurpose extends StatefulWidget {
  const VisitPurpose({Key? key}) : super(key: key);

  @override
  State<VisitPurpose> createState() => _VisitPurposeState();
}

class _VisitPurposeState extends State<VisitPurpose> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 50),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            labelText: 'Purpose of visit',
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 2, color: Palette.LAVENDAR_GREY),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 2, color: Palette.LAVENDAR_GREY),
              borderRadius: BorderRadius.circular(10),
            )),
        icon: Icon(Icons.keyboard_arrow_down),
        items: <String>['A', 'B', 'C', 'D'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
