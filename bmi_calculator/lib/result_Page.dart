import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/cardLayout.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String docomentation;
  ResultPage({this.bmiResult, this.resultText, this.docomentation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 15.0, left: 10),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'YOUR RESULT',
                  style: kResultTitle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: CardLayout(
                color: kActiveCardColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText,
                      style: kResultNormal,
                    ),
                    Text(
                      bmiResult,
                      style: kResult,
                    ),
                    Text(
                      docomentation,
                      textAlign: TextAlign.center,
                      style: kResultText,
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              text: 'RE-CALCULATE',
              onClick: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
