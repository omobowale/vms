import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_text_with_background.dart';
import 'package:vms/partials/common/confirmation_modal.dart';

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
                fontSize: 20,
              ),
            ),
          ),
          CustomTextWithBackground(
            text: rightText,
            textColor: Palette.FBN_BLUE,
            backgroundColor: Color.fromRGBO(0, 59, 101, 0.05),
            fn: () {
              showModalBottomSheet<void>(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return ConfirmationModal();
                  });
            },
          ),
        ],
      ),
    );
  }
}
