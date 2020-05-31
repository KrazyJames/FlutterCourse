import 'package:flutter/material.dart';
import 'views/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0C22),
        scaffoldBackgroundColor: Color(0xFF0A0C22),
        accentColor: Color(0xFFEF5065),
      ),
      home: InputPage(),
    );
  }
}
