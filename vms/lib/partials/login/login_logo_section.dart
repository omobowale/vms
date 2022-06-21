import 'package:flutter/material.dart';

class LoginLogoSection extends StatelessWidget {
  const LoginLogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 10),
      child: Row(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/fbn_name_logo.png",
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 4),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/images/fbn_year_logo.png",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Image.asset("assets/images/fbn_logo.png"),
          )
        ],
      ),
    );
  }
}
