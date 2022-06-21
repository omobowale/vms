import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool bordered;
  final int minLines;
  final int maxLines;

  CustomInputField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.bordered,
    this.minLines = 1,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: bordered ? Palette.FBN_BLUE : Palette.LAVENDAR_GREY,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: bordered ? Palette.FBN_BLUE : Palette.LAVENDAR_GREY,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
