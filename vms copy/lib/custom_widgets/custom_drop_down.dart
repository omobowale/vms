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
  late String selectedValue;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    selectedValue = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: selectedValue,
      decoration: InputDecoration(
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
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value.toString();
        });
        widget.onTap(value);
      },
    );
  }
}
