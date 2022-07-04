import 'package:flutter/material.dart';

class CustomSingleLineButton extends StatelessWidget {
  final String text;
  final Function fn;
  final Color backgroundColor;
  final Color textColor;

  const CustomSingleLineButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.fn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          // foregroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(EdgeInsets.all(15)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () {
          fn();
        },
      ),
    );
  }
}
