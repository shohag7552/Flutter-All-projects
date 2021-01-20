import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:mini_calculator/myButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  double eval;

  var userQuestion = '';
  var userAnswer = '';

  List<String> buttoms = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuestion,
                        style: TextStyle(
                            fontSize: 44, fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.normal),
                      )),
                ),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                  child: GridView.builder(
                      itemCount: buttoms.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return MyButtom(
                            buttonTap: () {
                              setState(() {
                                userQuestion = '';
                                userAnswer = '';
                              });
                            },
                            bottomText: buttoms[index],
                            color: Colors.green,
                            textColor: Colors.white,
                          );
                        } else if (index == 1) {
                          return MyButtom(
                            buttonTap: () {
                              setState(() {
                                userQuestion = userQuestion.substring(
                                    0, userQuestion.length - 1);
                              });
                            },
                            bottomText: buttoms[index],
                            color: Colors.red,
                            textColor: Colors.white,
                          );
                        } else if (index == buttoms.length - 1) {
                          return MyButtom(
                            buttonTap: () {
                              setState(() {
                                equel();
                              });
                            },
                            bottomText: buttoms[index],
                            color: Colors.deepPurple,
                            textColor: Colors.white,
                          );
                        } else if (index == buttoms.length - 2) {
                          return MyButtom(
                            buttonTap: () {
                              setState(() {
                                userQuestion = eval.toString();
                                
                              });
                            },
                            bottomText: buttoms[index],
                            color: Colors.deepPurple,
                            textColor: Colors.white,
                          );
                        } else {
                          return MyButtom(
                            buttonTap: () {
                              setState(() {
                                userQuestion = userQuestion + buttoms[index];
                              });
                            },
                            bottomText: buttoms[index],
                            color: isOperator(buttoms[index])
                                ? Colors.deepPurple
                                : Colors.deepPurple[50],
                            textColor: isOperator(buttoms[index])
                                ? Colors.white
                                : Colors.black,
                          );
                        }
                      })))
        ],
      ),
    );
  }

  bool isOperator(String s) {
    if (s == '%' || s == '/' || s == 'x' || s == '-' || s == '+') {
      return true;
    }
    return false;
  }

  void equel() {
    String finalquestion = userQuestion;
    finalquestion = finalquestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalquestion);

    ContextModel cm = ContextModel();
    eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
