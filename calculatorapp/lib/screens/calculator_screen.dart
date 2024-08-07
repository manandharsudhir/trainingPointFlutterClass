import 'package:calculatorapp/widgets/individual_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = "123456";
  String output = "";
  bool brackedTapped = false;

  void onTappedButton(String value) {
    setState(() {
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
        output = evaluete(input).toString();
      } else {
        input += value;
      }
    });
  }

  double evaluete(String input) {
    input = input.replaceAll("%", "/100");
    Parser p = Parser();
    Expression exp = p.parse(input);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    return eval;
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
                          Text(
                            output,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
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
                    text: "AC",
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
