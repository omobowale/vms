import 'package:flutter/material.dart';
import 'package:vms/custom_widgets/custom_module_card.dart';
import 'package:vms/views/view.dart';

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
          ModuleCard(
            moduleName: "Visitor Management",
            moduleIconPath: "assets/images/vms_module_icon.png",
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => View()));
            },
          ),
          ModuleCard(
            moduleName: "Canteen Management",
            moduleIconPath: "assets/images/cms_module_icon.png",
            onTap: () {},
          ),
          ModuleCard(
            moduleName: "Car Ordering",
            moduleIconPath: "assets/images/cos_module_icon.png",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
