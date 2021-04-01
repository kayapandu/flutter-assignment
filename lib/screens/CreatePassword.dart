import 'package:flutter/material.dart';

class CreatePassword extends StatefulWidget {
  @override
  _CreatePasswordState createState() {
    return _CreatePasswordState();
  }
}

class _CreatePasswordState extends State<CreatePassword> {
  final _formKey = GlobalKey<FormState>();

  String password = '';

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
            children: <Widget>[Text('Create Password')],
          ),
        ),
      ),
    );
  }
}
