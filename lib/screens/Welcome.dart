import 'package:flutter/material.dart';

import 'package:jago_assignment/widgets/CurveBackground.dart';
import 'package:jago_assignment/widgets/PageNumber.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() {
    return _WelcomeState();
  }
}

class _WelcomeState extends State<Welcome> {
  final _formKey = GlobalKey<FormState>();

  String emailAddress = '';

  bool _validateEmail(String value) {
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return (!regex.hasMatch(value)) ? false : true;
  }

  Widget _buildCurvePainter() {
    return Container(
      width: double.infinity,
      height: 250,
      child: CustomPaint(
        painter: CurveBackground(),
      ),
    );
  }

  Widget _buildFormHeading() {
    return Container(
      padding: EdgeInsets.only(top: 70),
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: 'Welcome to \nGIN ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                  color: Colors.black),
            ),
            TextSpan(
              text: 'Finans',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                  color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextContainer() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: 'Welcome to the Bank Of The Future.\n',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
            ),
            TextSpan(
              text: 'Manage and track your accounts on the go.',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailInput() {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Form(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Email',
                    icon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(2.0)),
                  ),
                  validator: (value) {
                    if (value != null) {
                      if (!_validateEmail(value)) {
                        return 'Invalid Email';
                      }
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      emailAddress = value;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ButtonTheme(
          minWidth: double.infinity,
          child: RaisedButton(
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue[200],
            onPressed: () => Navigator.pushNamed(context, '/createPassword'),
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
          top: false,
          child: Stack(
            children: <Widget>[
              _buildCurvePainter(),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    PageNumber(1),
                    _buildFormHeading(),
                    _buildTextContainer(),
                    _buildEmailInput(),
                    _buildNextButton()
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
