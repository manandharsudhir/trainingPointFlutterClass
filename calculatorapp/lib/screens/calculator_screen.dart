import 'package:calculatorapp/widgets/individual_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = "";
  String output = "";
  bool brackedTapped = false;
  bool tappedOnOperator = false;

  void onTappedButton(String value, ButtonType type) {
    setState(() {
      if (type == ButtonType.operator) {
        if (tappedOnOperator) {
          return;
        }
        tappedOnOperator = true;
      } else {
        tappedOnOperator = false;
      }
      if (value == "AC") {
        input = "";
        output = "";
      } else if (value == "()") {
        if (brackedTapped) {
          input += ")";
          brackedTapped = false;
        } else {
          input += "(";
          brackedTapped = true;
        }
      } else if (value == "=") {
        try {
          output = checkIfTheNumberIsDoubleOrInt(evaluate(input));
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Calculation Failed",
              style: TextStyle(fontSize: 32),
            ),
          ));
        }
      } else {
        input += value;
      }
    });
  }

  String checkIfTheNumberIsDoubleOrInt(double value) {
    if (value % 1 == 0) {
      return value.toInt().toString();
    } else {
      return value.toString();
    }
  }

  double evaluate(String input) {
    try {
      input = input.replaceAll("%", "/100");
      Parser p = Parser();
      Expression exp = p.parse(input);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      return eval;
    } catch (e) {
      throw "mero error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SafeArea(
              child: Container(
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      input,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 24,
                      ),
                    ),
                    Visibility(
                      visible: output.isNotEmpty,
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "=",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 24,
                              ),
                            ),
                            Expanded(
                              child: FittedBox(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  output,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Checkbox(
          //     value: true,
          //     onChanged: (value) {
          //       print(value);
          //     }),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Wrap(
                runSpacing: 8,
                spacing: 8,
                runAlignment: WrapAlignment.center,
                children: [
                  IndividualWidget(
                    onTap: onTappedButton,
                    btn: ButtonClass(title: "AC", type: ButtonType.ac),
                    color: Color(0xffF4F5F5),
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "()",
                    color: Color(0xffF4F5F5),
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "%",
                    color: Color(0xffF4F5F5),
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "/",
                    color: Color(0xffF4F5F5),
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "7",
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "8",
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "9",
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "*",
                    color: Color(0xffF4F5F5),
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "4",
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "5",
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "6",
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "-",
                    color: Color(0xffF4F5F5),
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "3",
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "2",
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "1",
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "+",
                    color: Color(0xffF4F5F5),
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "0",
                    colspan: 2,
                    color: Color(0xffF4F5F5),
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: ".",
                  ),
                  IndividualWidget(
                    onTap: onTappedButton,
                    text: "=",
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum ButtonType {
  number,
  operator,
  ac,
  bracket,
}

class ButtonClass {
  String title;
  ButtonType type;
  final double colspan;
  final Color color;
  final Color textColor;

  ButtonClass({
    required this.title,
    required this.type,
    this.colspan = 4,
    this.color = Colors.white,
    this.textColor = Colors.black,
  });
}
