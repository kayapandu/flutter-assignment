import 'package:flutter/material.dart';

//import Welcome screen
import 'package:jago_assignment/screens/Welcome.dart';
import 'package:jago_assignment/screens/CreatePassword.dart';
import 'package:jago_assignment/screens/PersonalInformation.dart';
import 'package:jago_assignment/screens/ScheduleVideoCall.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIN FINNANS',
      initialRoute: '/',
      routes: {
        '/': (BuildContext _) => Welcome(),
        '/createPassword': (BuildContext _) => CreatePassword(),
        '/personalInformation': (BuildContext _) => PersonalInformation(),
        '/scheduleVideoCall': (BuildContext _) => ScheduleVideoCall()
      },
    );
  }
}
