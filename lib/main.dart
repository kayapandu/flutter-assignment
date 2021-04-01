import 'package:flutter/material.dart';

//import Welcome screen
import 'package:jago_assignment/screens/Welcome.dart';
import 'package:jago_assignment/screens/CreatePassword.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIN FINNANS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext _) => Welcome(),
        '/createPassword': (BuildContext _) => CreatePassword()
      },
    );
  }
}
