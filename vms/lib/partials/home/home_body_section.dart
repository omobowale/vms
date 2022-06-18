import 'package:flutter/material.dart';
import 'package:vms/custom_widgets/module_card.dart';

class HomeBodySection extends StatefulWidget {
  const HomeBodySection({Key? key}) : super(key: key);

  @override
  State<HomeBodySection> createState() => _HomeBodySectionState();
}

class _HomeBodySectionState extends State<HomeBodySection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        childAspectRatio: 1.5,
        controller: new ScrollController(keepScrollOffset: false),
        children: [
          ModuleCard("Visitor Management", "assets/images/vms_module_icon.png"),
          ModuleCard("Canteen Management", "assets/images/cms_module_icon.png"),
          ModuleCard("Car Ordering", "assets/images/cos_module_icon.png"),
        ],
      ),
    );
  }
}
