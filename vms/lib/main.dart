import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/services/appointment_service.dart';
import 'package:vms/views/login.dart';

void setUpLocator() {
  GetIt.I.registerLazySingleton(() => AppointmentService());
}

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appointment Scheduler',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Palette.CUSTOM_WHITE,
        fontFamily: "GeneralSans",
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 15,
          title: const Text(""),
        ),
        body: const Login(),
      ),
    );
  }
}
