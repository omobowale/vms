import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/notifiers/purpose_notifier.dart';

class CustomDropDown extends StatefulWidget {
  final String text;
  final Function onTap;
  final Set<dynamic> lists;

  const CustomDropDown({
    Key? key,
    required this.text,
    required this.lists,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: widget.text,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Palette.LAVENDAR_GREY),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Palette.LAVENDAR_GREY),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: Icon(Icons.keyboard_arrow_down),
      items: widget.lists.map((value) {
        return DropdownMenuItem<String>(
          onTap: () {
            widget.onTap(value);
          },
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {
        // widget.onTap(_);
      },
    );
  }
}
