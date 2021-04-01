import 'package:flutter/material.dart';
import 'package:jago_assignment/widgets/PageNumber.dart';

class PersonalInformation extends StatefulWidget {
  @override
  _PersonalInformationState createState() {
    return _PersonalInformationState();
  }
}

class _PersonalInformationState extends State<PersonalInformation> {
  final _formKey = GlobalKey<FormState>();

  String goalActivation;
  String monthlyIncome;
  String monthlyExpense;
  List<String> listGoalActivation = [
    'Sallary',
    'Savings',
    'Transaction',
    'Others'
  ];

  List<String> listMonthlyIncome = [
    'IDR 1 - 3 Million',
    'IDR 3 - 7 Million',
    'IDR 7 - 10 Million',
    'IDR > 10 Million'
  ];

  Widget _buildFormHeading() {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 30),
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.white),
          children: <TextSpan>[
            TextSpan(
              text: 'Personal Information\n',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
            ),
            TextSpan(
              text:
                  'Please fillin the information below and yout goal for digital saving',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalActivationDropdown() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: InputDecorator(
        decoration: InputDecoration(
            labelText: 'Goal for Activation',
            labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(10),
            filled: true),
        child: DropdownButton<String>(
          hint: new Text('- Choose Option -'),
          isExpanded: true,
          isDense: true,
          value: goalActivation,
          items: listGoalActivation.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
              ),
            );
          }).toList(),
          onChanged: (String value) {
            setState(() {
              goalActivation = value;
            });
          },
        ),
      ),
    );
  }

  Widget _buildMonthlyIncomeDropdown() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: InputDecorator(
        decoration: InputDecoration(
            labelText: 'Monthly Income',
            labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(10),
            filled: true),
        child: DropdownButton<String>(
          hint: new Text('- Choose Option -'),
          isExpanded: true,
          isDense: true,
          value: monthlyIncome,
          items: listMonthlyIncome.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
              ),
            );
          }).toList(),
          onChanged: (String value) {
            setState(() {
              monthlyIncome = value;
            });
          },
        ),
      ),
    );
  }

  Widget _buildMonthlyExpenseDropdown() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: InputDecorator(
        decoration: InputDecoration(
            labelText: 'Monthly Income',
            labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(10),
            filled: true),
        child: DropdownButton<String>(
          hint: new Text('- Choose Option -'),
          isExpanded: true,
          isDense: true,
          value: monthlyExpense,
          items: listMonthlyIncome.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
              ),
            );
          }).toList(),
          onChanged: (String value) {
            setState(() {
              monthlyExpense = value;
            });
          },
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
            onPressed: () => Navigator.pushNamed(context, '/scheduleVideoCall'),
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              PageNumber(),
              _buildFormHeading(),
              _buildGoalActivationDropdown(),
              _buildMonthlyIncomeDropdown(),
              _buildMonthlyExpenseDropdown(),
              _buildNextButton()
            ],
          ),
        ),
      ),
    );
  }
}
