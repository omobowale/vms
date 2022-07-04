import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final bool isGH;
  const CustomBottomNavigationBar({Key? key, required this.isGH})
      : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  late var navigationTable = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigationTable = [
      '/home',
      '/view',
      widget.isGH ? '/appointment_requests' : '/view',
      '/view',
    ];
  }

  void navigateTo(int index) {
    Navigator.pushNamed(context, navigationTable[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Palette.CUSTOM_YELLOW,
      currentIndex: _selectedIndex,
      onTap: navigateTo,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Palette.FBN_BLUE,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
          label: 'Home',
          icon: ImageIcon(
            AssetImage("assets/images/navigation_home_icon.png"),
            color: Palette.CUSTOM_WHITE,
          ),
        ),
        new BottomNavigationBarItem(
          label: 'Folder',
          icon: ImageIcon(
            AssetImage("assets/images/navigation_folder_icon.png"),
            color: Palette.CUSTOM_WHITE,
          ),
        ),
        widget.isGH
            ? new BottomNavigationBarItem(
                label: 'Notification',
                icon: ImageIcon(
                  AssetImage("assets/images/navigation_approval_icon.png"),
                  color: Palette.CUSTOM_WHITE,
                ),
              )
            : new BottomNavigationBarItem(
                label: 'Requests',
                icon: ImageIcon(
                  AssetImage("assets/images/navigation_notification_icon.png"),
                  color: Palette.CUSTOM_WHITE,
                ),
              ),
        new BottomNavigationBarItem(
          label: 'Four',
          icon: Text(""),
        ),
      ],
    );
  }
}
