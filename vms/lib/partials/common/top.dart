import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';

class TopSection extends StatelessWidget {
  final String leftText;
  final String rightText;

  const TopSection({Key? key, required this.leftText, required this.rightText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              leftText,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(0, 59, 101, 0.05),
            ),
            child: Text(
              rightText,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Palette.FBN_BLUE,
              ),
            ),
          )
        ],
      ),
    );
  }
}
