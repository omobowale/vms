import 'package:flutter/material.dart';
import 'package:vms/custom_widgets/custom_drop_down.dart';

class AssetInformation extends StatefulWidget {
  const AssetInformation({Key? key}) : super(key: key);

  @override
  State<AssetInformation> createState() => _AssetInformationState();
}

class _AssetInformationState extends State<AssetInformation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Asset Information",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CustomDropDown(
            onTap: (value) {},
            text: "Asset type",
            lists: ["Phone", "Laptop", "Traveling bag"].toSet(),
          )
        ],
      ),
    );
  }
}
