import 'package:flutter/material.dart';

class PersonalInformation extends StatefulWidget {
  @override
  _PersonalInformationState createState() {
    return _PersonalInformationState();
  }
}

class _PersonalInformationState extends State<PersonalInformation> {
  final _formKey = GlobalKey<FormState>();

  String activationGoal = '';
  String monthlyIncome = '';
  String monthlyExpense = '';

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
            children: <Widget>[Text('Personal Information')],
          ),
        ),
      ),
    );
  }
}
