import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool bordered;
  final int minLines;
  final int maxLines;
  final Function onComplete;
  String initialValue;

  TextEditingController textEditingController = TextEditingController();

  CustomInputField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.bordered,
    required this.onComplete,
    this.initialValue = "",
    this.minLines = 1,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          print(textEditingController.text);
          onComplete(textEditingController.text);
        }
      },
      child: TextField(
        controller: textEditingController,
        minLines: minLines,
        maxLines: maxLines,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontSize: 17,
            // fontWeight: FontWeight.w500,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Palette.LAVENDAR_GREY),
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
      ),
    );
  }
}
