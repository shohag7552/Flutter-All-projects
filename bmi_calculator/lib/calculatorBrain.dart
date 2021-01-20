import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorBrain {
  final int height;
  final int weight;
  CalculatorBrain({@required this.height, @required this.weight});

  double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getPosition() {
    if (_bmi >= 25) {
      return 'Over Weight';
    } else if (_bmi > 18) {
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

  String getDocumentation() {
    if (_bmi >= 25) {
      return 'Your weight is higher then normal weight, so do more exercise.';
    } else if (_bmi > 18) {
      return 'You have normal body weight, good job!';
    }else{
      return 'You have lower then normal body weight, you need to eat more.';
    }
  }
}
