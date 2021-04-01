import 'package:flutter/material.dart';

class PageNumber extends StatefulWidget {
  @override
  _PageNumberState createState() {
    return _PageNumberState();
  }
}

class _PageNumberState extends State<PageNumber> {
  Widget _buildCircle(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: 60,
      height: 60,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black)),
        child: Center(
          child: Text('${index}'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          _buildCircle(1),
          Expanded(
            child: Divider(
              color: Colors.black,
              height: 20,
              thickness: 5,
            ),
          ),
          _buildCircle(2),
          Expanded(
            child: Divider(
              color: Colors.black,
              height: 20,
              thickness: 5,
            ),
          ),
          _buildCircle(3),
          Expanded(
            child: Divider(
              color: Colors.black,
              height: 20,
              thickness: 5,
            ),
          ),
          _buildCircle(4)
        ],
      ),
    );
  }
}
