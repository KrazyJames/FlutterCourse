import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.iconData, this.onPress});
  final IconData iconData;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: kGreyColor.withAlpha(0x29),
      elevation: 8.0,
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}