import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';

class CustomDropDown extends StatefulWidget {
  final String text;
  final List<String> lists;

  const CustomDropDown({Key? key, required this.text, required this.lists})
      : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          labelText: widget.text,
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
      items: widget.lists.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}
