import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jago_assignment/widgets/PageNumber.dart';

class ScheduleVideoCall extends StatefulWidget {
  @override
  _ScheduleVideoCallState createState() {
    return _ScheduleVideoCallState();
  }
}

class _ScheduleVideoCallState extends State<ScheduleVideoCall> {
  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  AnimationController animationController;

  List<String> monthList = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Des'
  ];
  List<String> daysList = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  void initState() {
    super.initState();
    _dateController.text = '- Choose Date -';
    _timeController.text = '- Choose Time -';
  }

  void _selectDate(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
        return _buildAndroidDatePicker(context);
      case TargetPlatform.iOS:
        return _buildIOSDatePicker(context);
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      _timeController.text = _getTimeString(picked);
      setState(() {
        selectedTime = picked;
      });
    }
  }

  String _getDateString(DateTime date) {
    return "${daysList[date.weekday - 1]}, ${date.day} ${monthList[date.month - 1]} ${date.year}";
  }

  String _getTimeString(TimeOfDay time) {
    String getMinute = time.minute.toString();
    String getHour = time.hour.toString();
    if (time.minute <= 9) getMinute = "0${time.minute.toString()}";
    if (time.hour <= 9) getHour = "0${time.hour.toString()}";
    return "$getHour:$getMinute";
  }

  //Due to flutter version i can't implement this animation controller

  // Widget _buildCalendarIcon() {
  //   return Container(
  //     alignment: Alignment.centerLeft,
  //     child: AnimatedBuilder(
  //       animation: animationController,
  //       builder: (context, child) {
  //         return Container(
  //           decoration: ShapeDecoration(
  //             color: Colors.white.withOpacity(0.5),
  //             shape: CircleBorder(),
  //           ),
  //           child: Padding(
  //             padding: EdgeInsets.all(8.0 * animationController.value),
  //             child: child,
  //           ),
  //         );
  //       },
  //       child: Container(
  //         decoration: ShapeDecoration(
  //           color: Colors.white,
  //           shape: CircleBorder(),
  //         ),
  //         child: IconButton(
  //           onPressed: () {},
  //           color: Colors.blue,
  //           icon: Icon(Icons.calendar_today, size: 26),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildFormHeading() {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 30),
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.white),
          children: <TextSpan>[
            TextSpan(
              text: 'Schedule Video Call\n',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
            ),
            TextSpan(
              text:
                  'Choose the date and time that you preferred, we will send link via email to make a video call on the scheduled date and time',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDate(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      child: TextFormField(
        enableInteractiveSelection: false,
        controller: _dateController,
        decoration: InputDecoration(
          filled: true,
          labelText: 'Date',
          fillColor: Colors.white,
          suffixIcon: Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
          ),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      ),
    );
  }

  _buildIOSDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (picked) {
              if (picked != selectedDate)
                _dateController.text = _getDateString(picked);
              setState(() {
                selectedDate = picked;
              });
            },
            initialDateTime: selectedDate,
            minimumDate: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day),
            maximumDate: DateTime.now().add(Duration(days: 10)),
            minimumYear: selectedDate.year,
            maximumYear: selectedDate.year,
          ),
        );
      },
    );
  }

  _buildAndroidDatePicker(BuildContext context) async {
    final DateTime datePicked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 10)),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      helpText: 'Available Schedule 10 days',
      cancelText: 'Cancel',
      confirmText: 'Select',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldLabelText: 'Schedule Date',
      fieldHintText: 'Month/Date/Year',
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    if (datePicked != null) {
      _dateController.text = _getDateString(datePicked);
      setState(() {
        selectedDate = datePicked;
      });
    }
  }

  Widget _buildTime(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enableInteractiveSelection: false,
        controller: _timeController,
        decoration: InputDecoration(
            filled: true,
            labelText: 'Time',
            fillColor: Colors.white,
            suffixIcon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            )),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectTime(context);
        },
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
            onPressed: () => Navigator.pushNamed(context, '/'),
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
              PageNumber(4),
              _buildFormHeading(),
              _buildDate(context),
              _buildTime(context),
              _buildNextButton()
            ],
          ),
        ),
      ),
    );
  }
}
