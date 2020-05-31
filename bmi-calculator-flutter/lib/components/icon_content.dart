import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.gender, @required this.icon});
  final String gender;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 64.0,
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
