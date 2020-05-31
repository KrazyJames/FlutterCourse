import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/model/calculator.dart';
import 'results_screen.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 70;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    bgColor: selectedGender == Gender.male
                        ? kActiveColor
                        : kDefaultColor,
                    cardChild: IconContent(
                      gender: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    bgColor: selectedGender == Gender.female
                        ? kActiveColor
                        : kDefaultColor,
                    cardChild: IconContent(
                      gender: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              bgColor: kDefaultColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberLabelTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: kGreyColor,
                      activeTrackColor: Colors.white,
                      thumbColor: Theme.of(context).accentColor,
                      overlayColor:
                          Theme.of(context).accentColor.withAlpha(0x29),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 16.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 32.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      max: kMaxHeight,
                      min: kMinHeight,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    bgColor: kDefaultColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kNumberLabelTextStyle,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'kg',
                                style: kLabelTextStyle,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  if (weight < 220) {
                                    weight++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    bgColor: kDefaultColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (age > 1) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  if (age < 220) {
                                    age++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: BottomButton(
              title: "CALCULATE",
              onTap: () {
                Calculator calc = Calculator(height: height, weight: weight);
                calc.calculate();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Results(
                        bmi: calc.getBMI(),
                        bmiState: calc.getState(),
                        advice: calc.getAdvice(),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
