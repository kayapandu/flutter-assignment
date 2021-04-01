import 'package:flutter/material.dart';

class ScheduleVideoCall extends StatefulWidget {
  @override
  _ScheduleVideoCallState createState() {
    return _ScheduleVideoCallState();
  }
}

class _ScheduleVideoCallState extends State<ScheduleVideoCall> {
  final _formKey = GlobalKey<FormState>();

  String date = '';
  String time = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Lato',
            )),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[Text('Schedule Video Call')],
          ),
        ),
      ),
    );
  }
}
