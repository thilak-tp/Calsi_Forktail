import 'package:flutter/material.dart';

import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '0';
  var answerAgain = '';

  final buttons = const [
    'C',
    'DEL',
    '/',
    '%',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.black,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 50),
                    Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          userQuestion,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          userAnswer,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        )),
                  ]),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              //padding: const EdgeInsets.all(20),
              child: Center(
                  child: //MyBottons(color: Colors.deepOrange,textColor: Colors.white,buttonText: '0',)
                      GridView.builder(
                          itemCount: buttons.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 1) {
                              return MyBottons(
                                buttonTapped: () {
                                  setState(() {
                                    userQuestion = userQuestion.substring(
                                        0, userQuestion.length - 1);
                                  });
                                },
                                buttonText: buttons[index],
                                color: Colors.red,
                                textColor: Colors.white,
                              );
                            } else if (index == 19) {
                              return MyBottons(
                                buttonTapped: () {
                                  setState(() {
                                    equalPressed();
                                  });
                                },
                                buttonText: buttons[index],
                                color: Colors.redAccent,
                                textColor: Colors.white,
                              );
                            } else if (index == 18) {
                              return MyBottons(
                                buttonTapped: () {
                                  setState(() {
                                    equalPressed();
                                    userQuestion = answerAgain;
                                  });
                                },
                                buttonText: buttons[index],
                                color: Colors.redAccent,
                                textColor: Colors.white,
                              );
                            } else if (index == 0) {
                              return MyBottons(
                                  buttonTapped: () {
                                    setState(() {
                                      userQuestion = '';
                                      userAnswer = '0';
                                    });
                                  },
                                  buttonText: buttons[index],
                                  color: Colors.green,
                                  textColor: Colors.white);
                            } else {
                              return MyBottons(
                                buttonTapped: () {
                                  setState(() {
                                    userQuestion += buttons[index];
                                  });
                                },
                                buttonText: buttons[index],
                                color: isOptr(buttons[index])
                                    ? Colors.deepOrange
                                    : Colors.orange[50],
                                textColor: isOptr(buttons[index])
                                    ? Colors.white
                                    : Colors.orange,
                              );
                            }
                          })),
            ),
          ),
        ],
      ),
    );
  }

  bool isOptr(String x) {
    if (x == '+' || x == '-' || x == '*' || x == '/' || x == '%' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
    answerAgain = userAnswer;
  }
}
