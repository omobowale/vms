import 'package:flutter/material.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_single_line_button.dart';
import 'package:vms/views/home.dart';
import 'package:vms/partials/login/login_logo_section.dart';
import 'package:vms/partials/login/login_welcome_section.dart';
import 'package:vms/views/view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // color: Colors.red,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoginLogoSection(),
                    LoginWelcomeSection(),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(bottom: 10),
                          child: Material(
                            elevation: 0.5,
                            borderRadius: BorderRadius.circular(10),
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textCapitalization: TextCapitalization.characters,
                              controller: usernameController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.07),
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.07),
                                    width: 2,
                                  ),
                                ),
                                labelText: 'Username',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Material(
                            elevation: 0.5,
                            borderRadius: BorderRadius.circular(10),
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              controller: passwordController,
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.07),
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.07),
                                    width: 2,
                                  ),
                                ),
                                labelText: 'Password',
                                suffixIcon: IconButton(
                                  icon: Icon(_isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() => _isObscure = !_isObscure);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              // color: Colors.blue,
              child: Column(
                children: [
                  CustomSingleLineButton(
                      text: "Login",
                      backgroundColor: Palette.FBN_BLUE,
                      textColor: Palette.CUSTOM_WHITE,
                      fn: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Home()));
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
