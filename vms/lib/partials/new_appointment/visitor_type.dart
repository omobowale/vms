import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';

class VisitorType extends StatefulWidget {
  const VisitorType({Key? key}) : super(key: key);

  @override
  State<VisitorType> createState() => _VisitorTypeState();
}

class _VisitorTypeState extends State<VisitorType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Visitor Type",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(14),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Palette.FBN_BLUE,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Regular",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: Palette.FBN_BLUE,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(14),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              border: Border.all(
                color: Color(0xffE2E4E8),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "VVIP",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  Icons.circle,
                  color: Color(0xffE2E4E8),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
