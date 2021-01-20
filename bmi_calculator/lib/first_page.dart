import 'package:bmi_calculator/calculatorBrain.dart';
import 'package:bmi_calculator/result_Page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottom_button.dart';
import 'cardLayout.dart';
import 'constants.dart';

// enum is used for understanding the code easily.
enum gender {
  male,
  female,
}
int height = 180;
int weight = 30;
int age = 10;

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardLayout(
                    onCardTap: () {
                      setState(() {
                        selectedGender = gender.male;
                      });
                    },
                    color: selectedGender == gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: MaleFemaleSection(
                      iconData: FontAwesomeIcons.mars,
                      name: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: CardLayout(
                    onCardTap: () {
                      setState(() {
                        selectedGender = gender.female;
                      });
                    },
                    color: selectedGender == gender.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: MaleFemaleSection(
                      iconData: FontAwesomeIcons.venus,
                      name: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardLayout(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kBoldTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        inactiveTickMarkColor: Color(0xFF8D8E98),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25),
                        overlayColor: Color(0x40EB1555)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        //activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
              color: kActiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardLayout(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBoldTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularButton(
                              icon: FontAwesomeIcons.minus,
                              onPrassed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircularButton(
                              icon: FontAwesomeIcons.plus,
                              onPrassed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardLayout(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBoldTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularButton(
                              icon: FontAwesomeIcons.minus,
                              onPrassed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircularButton(
                              icon: FontAwesomeIcons.plus,
                              onPrassed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE',
            onClick: () {
              CalculatorBrain brain =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: brain.calculateBMI(),
                    resultText: brain.getPosition(),
                    docomentation: brain.getDocumentation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class MaleFemaleSection extends StatelessWidget {
  final String name;

  final IconData iconData;
  MaleFemaleSection({this.iconData, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          name,
          style: kTextStyle,
        )
      ],
    );
  }
}

class CircularButton extends StatelessWidget {
  final IconData icon;
  final Function onPrassed;
  CircularButton({@required this.icon, @required this.onPrassed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPrassed,
      elevation: 6,
      child: Icon(icon),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
