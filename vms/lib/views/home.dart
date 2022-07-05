import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/notifiers/login_logout_notifier.dart';
import 'package:vms/notifiers/user_notifier.dart';
import 'package:vms/partials/home/home_body_section.dart';
import 'package:vms/partials/home/home_menu_section.dart';
import 'package:vms/views/login.dart';
import 'package:vms/views/view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // UserNotifier userNotifier = UserNotifier();
    // userNotifier.isGH();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = context.read<LoginLogoutNotifier>().isLoggedIn;
    print("all enums home: " +
        context.read<LoginLogoutNotifier>().allEnums.toString());
    return Scaffold(
      body: isLoggedIn
          ? Container(
              color: Color(0xff174574),
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 40),
                    child: HomeMenuSection(),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 40),
                    child: HomeBodySection(),
                  ),
                ],
              ),
            )
          : Login(),
    );
  }
}
