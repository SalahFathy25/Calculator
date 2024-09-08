import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/CalcButton.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String expression = '';
  final List<String> historyList = [];

  void numClick(String text) {
    setState(() => expression += text);
  }

  void allClear(String text) {
    setState(() {
      historyList.clear();
      expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      expression = '';
    });
  }

  void delete(String text) {
    setState(() {
      if (expression.isNotEmpty) {
        expression = expression.substring(0, expression.length - 1);
      }
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    ContextModel cm = ContextModel();
    Expression ex;

    try {
      ex = p.parse(expression);
      String result = ex.evaluate(EvaluationType.REAL, cm).toString();
      setState(() {
        historyList.insert(0, '$expression = $result');
        expression = result;
      });
    } catch (e) {
      setState(() {
        historyList.insert(0, 'Error');
        expression = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Calculator',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 25,
            ),
          ),
          backgroundColor: const Color(0xff2d2f34),
        ),
        backgroundColor: const Color(0xff2d2f34),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: historyList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      historyList[index],
                      style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: const Alignment(1.0, 1.0),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  expression,
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff121315),
                borderRadius: BorderRadius.circular(25),
              ),
              width: 500,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(
                        text: 'ac',
                        fillColor: const Color(0xff0f5322),
                        textColor: const Color(0xffc2edcf),
                        textSize: 15,
                        callback: allClear,
                      ),
                      CalcButton(
                        text: 'C',
                        fillColor: const Color(0xff0f5322),
                        textColor: const Color(0xffc2edcf),
                        callback: clear,
                        textSize: 28,
                      ),
                      CalcButton(
                        text: '%',
                        fillColor: const Color(0xff004b76),
                        textColor: const Color(0xffc2e7ff),
                        callback: numClick,
                        textSize: 28,
                      ),
                      CalcButton(
                        text: '/',
                        fillColor: const Color(0xff004b76),
                        textColor: const Color(0xffc2e7ff),
                        callback: numClick,
                        textSize: 28,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(
                        text: '7',
                        fillColor: const Color(0xff1c1d1f),
                        textColor: const Color(0xffffffff),
                        callback: numClick,
                        textSize: 28,
                      ),
                      CalcButton(
                        text: '8',
                        fillColor: const Color(0xff1c1d1f),
                        textColor: const Color(0xffffffff),
                        callback: numClick,
                        textSize: 28,
                      ),
                      CalcButton(
                        text: '9',
                        fillColor: const Color(0xff1c1d1f),
                        textColor: const Color(0xffffffff),
                        callback: numClick,
                        textSize: 28,
                      ),
                      CalcButton(
                        text: '*',
                        fillColor: const Color(0xff004b76),
                        textColor: const Color(0xffc2e7ff),
                        textSize: 28,
                        callback: numClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(
                        text: '4',
                        fillColor: const Color(0xff1c1d1f),
                        textColor: const Color(0xffffffff),
                        callback: numClick,
                        textSize: 28,
                      ),
                      CalcButton(
                        text: '5',
                        fillColor: const Color(0xff1c1d1f),
                        textColor: const Color(0xffffffff),
                        callback: numClick,
                        textSize: 28,
                      ),
                      CalcButton(
                        text: '6',
                        fillColor: const Color(0xff1c1d1f),
                        textColor: const Color(0xffffffff),
                        textSize: 28,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '-',
                        fillColor: const Color(0xff004b76),
                        textColor: const Color(0xffc2e7ff),
                        textSize: 45,
                        callback: numClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(
                        text: '1',
                        fillColor: const Color(0xff1c1d1f),
                        textColor: const Color(0xffffffff),
                        callback: numClick,
                        textSize: 28,
                      ),
                      CalcButton(
                        text: '2',
                        fillColor: const Color(0xff1c1d1f),
                        textColor: const Color(0xffffffff),
                        callback: numClick,
                        textSize: 28,
                      ),
                      CalcButton(
                        text: '3',
                        fillColor: const Color(0xff1c1d1f),
                        textColor: const Color(0xffffffff),
                        callback: numClick,
                        textSize: 28,
                      ),
                      CalcButton(
                        text: '+',
                        fillColor: const Color(0xff004b76),
                        textColor: const Color(0xffc2e7ff),
                        textSize: 35,
                        callback: numClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(
                        text: '.',
                        fillColor: const Color(0xff1c1d1f),
                        textColor: const Color(0xffffffff),
                        callback: numClick,
                        textSize: 28,
                      ),
                      CalcButton(
                        text: '0',
                        fillColor: const Color(0xff1c1d1f),
                        textColor: const Color(0xffffffff),
                        callback: numClick,
                        textSize: 28,
                      ),
                      CalcButton(
                        icon: Icons.backspace,
                        fillColor: const Color(0xff1c1d1f),
                        textColor: const Color(0xffffffff),
                        callback: delete,
                        text: '',
                        textSize: 28,
                      ),
                      CalcButton(
                        text: '=',
                        fillColor: const Color(0xff0942a1),
                        textColor: const Color(0xffd3e3fc),
                        callback: evaluate,
                        textSize: 35,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
