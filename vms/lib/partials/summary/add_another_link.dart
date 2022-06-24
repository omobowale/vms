import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';

class AddAnotherLink extends StatelessWidget {
  const AddAnotherLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            Icons.add,
            color: Palette.FBN_BLUE,
          ),
          Text(
            "Add another guest",
            style:
                TextStyle(color: Palette.FBN_BLUE, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
