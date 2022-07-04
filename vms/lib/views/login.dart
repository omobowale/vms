import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_error_label.dart';
import 'package:vms/custom_widgets/custom_input_label.dart';
import 'package:vms/custom_widgets/custom_single_line_button.dart';
import 'package:vms/models/api_response.dart';
import 'package:vms/models/user.dart';
import 'package:vms/notifiers/login_logout_notifier.dart';
import 'package:vms/services/login_service.dart';
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
  late APIResponse<User> user;
  LoginService get service => GetIt.I<LoginService>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  String usernameError = "";
  String passwordError = "";
  Color usernameErrorColor = Colors.grey;
  Color passwordErrorColor = Colors.grey;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LoginLogoutNotifier _loginLogoutNotifier =
        Provider.of<LoginLogoutNotifier>(context);
    bool isLoggedIn = _loginLogoutNotifier.isLoggedIn;
    return isLoggedIn
        ? Home()
        : Scaffold(
            appBar: AppBar(
              actions: null,
              automaticallyImplyLeading: false,
              backgroundColor: Palette.CUSTOM_WHITE,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoginLogoSection(),
                    Container(
                      // color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LoginWelcomeSection(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(bottom: 10, top: 10),
                                  child: Material(
                                    elevation: 0.5,
                                    borderRadius: BorderRadius.circular(10),
                                    child: TextFormField(
                                      onChanged: ((value) {
                                        setState(() {
                                          usernameErrorColor = Colors.grey;
                                        });
                                      }),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: usernameController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.07),
                                            width: 2,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.07),
                                            width: 2,
                                          ),
                                        ),
                                        labelText: 'Username',
                                        labelStyle: TextStyle(
                                            color: usernameErrorColor),
                                        hintText: "Enter Username",
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Material(
                                    elevation: 0.5,
                                    borderRadius: BorderRadius.circular(10),
                                    child: TextFormField(
                                      onChanged: ((value) {
                                        setState(() {
                                          passwordErrorColor = Colors.grey;
                                        });
                                      }),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      controller: passwordController,
                                      obscureText: _isObscure,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.07),
                                            width: 2,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.07),
                                            width: 2,
                                          ),
                                        ),
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                          color: passwordErrorColor,
                                        ),
                                        hintText: 'Enter Password',
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isObscure
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color:
                                                Colors.black.withOpacity(0.2),
                                          ),
                                          onPressed: () {
                                            setState(
                                                () => _isObscure = !_isObscure);
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
                              isLoading: isLoading,
                              text: "Login",
                              backgroundColor: Palette.FBN_BLUE,
                              textColor: Palette.CUSTOM_WHITE,
                              fn: () async {
                                if (usernameController.text == "") {
                                  setState(() {
                                    usernameError = "Please enter username";
                                    usernameErrorColor = Colors.red;
                                  });
                                } else {
                                  setState(() {
                                    usernameError = "";
                                  });
                                }
                                if (usernameController.text == "") {
                                  setState(() {
                                    passwordError = "Please enter password";
                                    passwordErrorColor = Colors.red;
                                  });
                                } else {
                                  setState(() {
                                    passwordError = "";
                                  });
                                }
                                if (passwordError == "" &&
                                    usernameError == "") {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  var loginId = usernameController.text +
                                      passwordController.text;
                                  service.login(loginId).then((value) {
                                    if (value.data != null) {
                                      var newUser = value.data ?? null;
                                      context
                                          .read<LoginLogoutNotifier>()
                                          .logUserIn(newUser!)
                                          .then(
                                        (value) {
                                          print(context
                                              .read<LoginLogoutNotifier>()
                                              .isLoggedIn);
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => Home()),
                                          );
                                        },
                                      );
                                    }
                                    print("value: " + value.data.toString());
                                    setState(() {
                                      isLoading = false;
                                    });
                                  });
                                }
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
