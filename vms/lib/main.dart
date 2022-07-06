import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/models/screen_arguments.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/notifiers/appointment_status_types_notifier.dart';
import 'package:vms/notifiers/asset_present_bool_notifier.dart';
import 'package:vms/notifiers/assets_notifier.dart';
import 'package:vms/notifiers/group_heads_notifier.dart';
import 'package:vms/notifiers/locations_notifier.dart';
import 'package:vms/notifiers/login_logout_notifier.dart';
import 'package:vms/notifiers/user_notifier.dart';
import 'package:vms/notifiers/purpose_notifier.dart';
import 'package:vms/notifiers/rooms_notifier.dart';
import 'package:vms/notifiers/time_selection_notifier.dart';
import 'package:vms/services/appointment_service.dart';
import 'package:vms/services/enum_service.dart';
import 'package:vms/services/group_head_service.dart';
import 'package:vms/services/host_name_service.dart';
import 'package:vms/services/location_service.dart';
import 'package:vms/services/login_service.dart';
import 'package:vms/views/checker/appointment_requests.dart';
import 'package:vms/views/commons/details.dart';
import 'package:vms/views/home.dart';
import 'package:vms/views/login.dart';
import 'package:vms/views/maker/appointment_creation_success.dart';
import 'package:vms/views/maker/appointment_location.dart';
import 'package:vms/views/maker/appointment_updated_success.dart';
import 'package:vms/views/maker/cancel_appointment.dart';
import 'package:vms/views/maker/new_appointment.dart';
import 'package:vms/views/maker/reschedule_appointment.dart';
import 'package:vms/views/maker/summary.dart';
import 'package:vms/views/maker/visitor_information.dart';
import 'package:vms/views/view.dart';

void setUpLocator() {
  //Register your services here
  GetIt.I.registerLazySingleton(() => AppointmentService());
  GetIt.I.registerLazySingleton(() => LoginService());
  GetIt.I.registerLazySingleton(() => EnumService());
  GetIt.I.registerLazySingleton(() => GroupHeadService());
  GetIt.I.registerLazySingleton(() => HostNameService());
  GetIt.I.registerLazySingleton(() => LocationService());
}

void main() {
  setUpLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppointmentNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => PurposeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => RoomsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => AssetPresentBoolNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => AssetsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => TimeSelectionNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppointmentStatusNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => GroupHeadsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginLogoutNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocationsNotifier(),
        ),
      ],
      child: MyApp(),
    ),
  );
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
      home: Login(),
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == Details.routeName) {
          // Cast the arguments to the correct
          // type: ScreenArguments.
          print("settings.arguments " + settings.arguments.toString());
          final args = settings.arguments as ScreenArguments;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return Details(
                id: args.id,
                isApproved: args.isApproved,
              );
            },
          );
        }
        // The code only supports
        // PassArgumentsScreen.routeName right now.
        // Other values need to be implemented if we
        // add them. The assertion here will help remind
        // us of that higher up in the call stack, since
        // this assertion would otherwise fire somewhere
        // in the framework.
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/view': (context) => View(),
        '/new_appointment': (context) => NewAppointment(),
        '/reschedule_appointment': (context) => RescheduleAppointment(),
        '/summary': (context) => Summary(),
        '/reschedule_appointment': (context) => RescheduleAppointment(),
        '/cancel_appointment': (context) => CancelAppointment(),
        '/appointment_requests': (context) => AppointmentRequests(),
        '/appointment_location': (context) => AppointmentLocation(),
        '/appointment_created': (context) => AppointmentCreationSuccess(),
        '/appointment_updated': (context) => AppointmentUpdatedSuccess(),
      },
    );
  }
}
