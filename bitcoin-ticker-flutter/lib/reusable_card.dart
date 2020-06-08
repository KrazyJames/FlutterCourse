import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String crypto;
  final double rate;
  final String currency;
  ReusableCard({this.crypto, this.rate, this.currency});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: Text(
            '1 $crypto = $rate $currency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
