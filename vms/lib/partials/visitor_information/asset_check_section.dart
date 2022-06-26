import 'package:flutter/material.dart';
import 'package:vms/custom_widgets/custom_radio_button.dart';
import 'package:vms/custom_widgets/custom_radio_group.dart';

class AssetCheckSection extends StatefulWidget {
  const AssetCheckSection({Key? key}) : super(key: key);

  @override
  State<AssetCheckSection> createState() => _AssetCheckSectionState();
}

class _AssetCheckSectionState extends State<AssetCheckSection> {
  List<CustomRadioButton> radiolists = [
    new CustomRadioButton(
      labelText: "Yes",
      checked: true,
      checkText: '',
      isAvailable: true,
      isClicked: () {},
    ),
    new CustomRadioButton(
      labelText: "No",
      checkText: "",
      checked: false,
      isAvailable: true,
      isClicked: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: CustomRadioGroup(
          labelText: "Will visitor be with assets?", radiolist: radiolists),
    );
  }
}
