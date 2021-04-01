import 'package:flutter/material.dart';
import 'package:jago_assignment/widgets/PageNumber.dart';

class CreatePassword extends StatefulWidget {
  @override
  _CreatePasswordState createState() {
    return _CreatePasswordState();
  }
}

class _CreatePasswordState extends State<CreatePassword> {
  final _formKey = GlobalKey<FormState>();

  String password = '';
  bool isLowercase, isUppercase, isNumber, isRichCharacter, showPassword;

  @override
  void initState() {
    super.initState();
    showPassword = false;
    isLowercase = false;
    isUppercase = false;
    isNumber = false;
    isRichCharacter = false;
  }

  Widget _buildFormHeading() {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 30),
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.white),
          children: <TextSpan>[
            TextSpan(
              text: 'Create Password\n',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
            ),
            TextSpan(
              text: 'Password willl be used to login to account',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordInput() {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 10),
      alignment: Alignment.center,
      child: Form(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  obscureText: !this.showPassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye, color: Colors.blue[600]),
                      onPressed: () {
                        setState(() => showPassword = !showPassword);
                      },
                    ),
                    hintText: 'Create Password',
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                  ),
                  onChanged: (value) {
                    setState(() {
                      password = value;
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

  Widget _buildComplexityText() {
    return Container(
        padding: EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Complexity:',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Text(
              'Very Weak',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ));
  }

  Widget _buildComplexityInformation() {
    return Container(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('a',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: isLowercase ? Colors.green : Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                Text('Lowercase',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            Column(
              children: <Widget>[
                Text('A',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: isUppercase ? Colors.green : Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                Text('Uppercase',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            Column(
              children: <Widget>[
                Text('123',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: isNumber ? Colors.green : Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                Text('Number',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            Column(
              children: <Widget>[
                Text('9+',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: isRichCharacter ? Colors.green : Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                Text('Characters',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ));
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
            onPressed: () =>
                Navigator.pushNamed(context, '/personalInformation'),
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Lato',
            )),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              PageNumber(2),
              _buildFormHeading(),
              _buildPasswordInput(),
              _buildComplexityText(),
              _buildComplexityInformation(),
              _buildNextButton()
            ],
          ),
        ),
      ),
    );
  }
}
