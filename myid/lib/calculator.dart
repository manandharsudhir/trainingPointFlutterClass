import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Caculator extends StatefulWidget {
  const Caculator({super.key});

  @override
  State<Caculator> createState() => _CaculatorState();
}

class _CaculatorState extends State<Caculator> {
  String finalOutput = "";
  String inputValues = "";
  bool bracketPressed = false;

  void onTappedValue(String value) {
    setState(() {
      if (value == "AC") {
        if (inputValues.isNotEmpty) {
          inputValues = inputValues.substring(0, inputValues.length - 1);
        }
      } else if (value == "C") {
        if (inputValues.isNotEmpty) {
          inputValues = "";
        }
      } else if (value == "()") {
        if (bracketPressed) {
          inputValues += ")";
          bracketPressed = false;
        } else {
          inputValues += "(";
          bracketPressed = true;
        }
      } else if (value == "C") {
        inputValues = "";
      } else {
        inputValues += value;
      }
    });
    // print(inputValues);
  }

  void onEqualPressed() {
    String toCaluculate = inputValues.replaceAll("X", "*");
    toCaluculate = toCaluculate.replaceAll("%", "/100");
    try {
      Parser p = Parser();
      Expression exp = p.parse(toCaluculate);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      setState(() {
        finalOutput = eval.toString();
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        finalOutput = "Error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("building");
    return Scaffold(
      backgroundColor: Color(0xff15181F),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //Output Display
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      finalOutput,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 64,
                          fontWeight: FontWeight.bold),
                    ),
                    //input Display
                    Container(
                      width: double.infinity,
                      height: 100,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xff21242E),
                      ),
                      child: FittedBox(
                        alignment: Alignment.centerRight,
                        child: Text(
                          inputValues,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                flex: 7,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  runAlignment: WrapAlignment.end,
                  children: [
                    CalculatorNumpadItemWIdget(
                      value: "AC",
                      colSpan: 4,
                      onTap: () {
                        onTappedValue("AC");
                      },
                      onLongPress: () {
                        onTappedValue("C");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "()",
                      colSpan: 4,
                      onTap: () {
                        onTappedValue("()");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "%",
                      onTap: () {
                        onTappedValue("%");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "/",
                      onTap: () {
                        onTappedValue("/");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "7",
                      onTap: () {
                        onTappedValue("7");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "8",
                      onTap: () {
                        onTappedValue("8");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "9",
                      onTap: () {
                        onTappedValue("9");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "x",
                      onTap: () {
                        onTappedValue("X");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "4",
                      onTap: () {
                        onTappedValue("4");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "5",
                      onTap: () {
                        onTappedValue("5");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "6",
                      onTap: () {
                        onTappedValue("6");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "-",
                      onTap: () {
                        onTappedValue("-");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "1",
                      onTap: () {
                        onTappedValue("1");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "2",
                      onTap: () {
                        onTappedValue("2");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "3",
                      onTap: () {
                        onTappedValue("3");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "+",
                      onTap: () {
                        onTappedValue("+");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "0",
                      colSpan: 2,
                      onTap: () {
                        onTappedValue("0");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: ".",
                      onTap: () {
                        onTappedValue(".");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "=",
                      onTap: () {
                        onEqualPressed();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorNumpadItemWIdget extends StatelessWidget {
  const CalculatorNumpadItemWIdget(
      {super.key,
      required this.value,
      this.colSpan = 4,
      required this.onTap,
      this.onLongPress});
  final int colSpan;
  final String value;
  final void Function() onTap;
  final VoidCallback? onLongPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        color: Color(0xff373F4C),
        width: (MediaQuery.of(context).size.width / colSpan) - 8,
        height: (MediaQuery.of(context).size.height / 10),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
