import 'package:flutter/material.dart';

class HomeMenuSection extends StatefulWidget {
  const HomeMenuSection({Key? key}) : super(key: key);

  @override
  State<HomeMenuSection> createState() => _HomeMenuSectionState();
}

class _HomeMenuSectionState extends State<HomeMenuSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Color.fromRGBO(0, 0, 0, 0.56),
                child: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/fbn_logo_bg_2x.png",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  radius: 20,
                  // backgroundImage: AssetImage(
                  //   "assets/images/fbn_logo_bg_2x.png",
                  // ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi Omobowale",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Select a service",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.only(top: 6, bottom: 6)),
                  backgroundColor: MaterialStateProperty.all(Color(0xffE8BF4E)),
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff003366),
                    fontSize: 16,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
