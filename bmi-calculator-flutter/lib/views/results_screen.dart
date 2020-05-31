import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';

class Results extends StatelessWidget {
  Results({this.bmi, this.bmiState, this.advice});

  final String bmi;
  final String advice;
  final String bmiState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              bgColor: kDefaultColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    bmiState,
                    style: kResultsTextStyle,
                  ),
                  Text(
                    bmi,
                    style: kResultNumberTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      advice,
                      style: kAdviceTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: BottomButton(
              title: "RE-CALCULATE",
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
