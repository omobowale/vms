import 'package:flutter/material.dart';

class CustomAlertDialogBox extends StatelessWidget {
  final String textTitle;
  final String textContent;
  final Color color;
  final String redirectLocation;

  const CustomAlertDialogBox({
    Key? key,
    required this.textTitle,
    required this.textContent,
    required this.color,
    required this.redirectLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        textTitle,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Text(
        textContent,
        style: TextStyle(
          color: color,
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, redirectLocation);
          },
          child: Text("Ok"),
        ),
      ],
    );
  }
}
