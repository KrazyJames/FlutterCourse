import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color bgColor;
  final Widget cardChild;
  final Function onTap;

  ReusableCard({@required this.bgColor, @required this.cardChild, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: cardChild,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}