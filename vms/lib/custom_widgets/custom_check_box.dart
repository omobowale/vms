import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';

class CustomCheckBox extends StatelessWidget {
  final String labelText;
  final bool checked;
  final bool isAvailable;

  const CustomCheckBox(
      {Key? key,
      required this.labelText,
      required this.checked,
      required this.isAvailable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(14),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            boxShadow: !checked
                ? [
                    BoxShadow(
                      color: Colors.white,

                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]
                : [],
            border: Border.all(
              color: checked ? Palette.FBN_BLUE : Palette.LAVENDAR_GREY,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                labelText,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: (!checked && !isAvailable)
                        ? Palette.LAVENDAR_GREY
                        : Palette.FBN_BLUE),
              ),
              Container(
                child: checked
                    ? Icon(
                        Icons.check_circle,
                        color: Palette.FBN_BLUE,
                      )
                    : (isAvailable
                        ? Icon(
                            Icons.circle_outlined,
                            color: Palette.LAVENDAR_GREY,
                          )
                        : Container(
                            child: Text(
                              "Unavailable".toUpperCase(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 119, 139, 158)
                                    .withOpacity(0.6),
                              ),
                            ),
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Palette.CUSTOM_WHITE,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                color: Palette.LAVENDAR_GREY),
                          )),
                // color: Palette.FBN_BLUE,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
