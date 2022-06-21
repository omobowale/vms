import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';

class HostSection extends StatefulWidget {
  const HostSection({Key? key}) : super(key: key);

  @override
  State<HostSection> createState() => _HostSectionState();
}

class _HostSectionState extends State<HostSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.red,
              labelText: "Host name",
              hintText: "Host name",
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Palette.LAVENDAR_GREY,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Palette.LAVENDAR_GREY,
                  width: 2.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
