import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = "123456";
  String output = "";

  List<String> values = ["AC", "()", "%", "/", "7", "8", "9"];

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
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      input,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 24,
                      ),
                    ),
                    Visibility(
                      visible: output.isNotEmpty,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "=",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            output,
                            style: TextStyle(
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
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(24),
              child: Wrap(
                runSpacing: 8,
                spacing: 8,
                runAlignment: WrapAlignment.center,
                children: [
                  IndividualWidget(
                    text: "AC",
                    color: Color(0xffF4F5F5),
                  ),
                  IndividualWidget(
                    text: "()",
                  ),
                  IndividualWidget(
                    text: "%",
                  ),
                  IndividualWidget(
                    text: "/",
                  ),
                  IndividualWidget(
                    text: "7",
                  ),
                  IndividualWidget(
                    text: "8",
                  ),
                  IndividualWidget(
                    text: "9",
                  ),
                  IndividualWidget(
                    text: "*",
                  ),
                  IndividualWidget(
                    text: "4",
                  ),
                  IndividualWidget(
                    text: "5",
                  ),
                  IndividualWidget(
                    text: "6",
                  ),
                  IndividualWidget(
                    text: "-",
                  ),
                  IndividualWidget(
                    text: "3",
                  ),
                  IndividualWidget(
                    text: "2",
                  ),
                  IndividualWidget(
                    text: "1",
                  ),
                  IndividualWidget(
                    text: "+",
                  ),
                  IndividualWidget(
                    text: "0",
                    colspan: 2,
                  ),
                  IndividualWidget(
                    text: ".",
                  ),
                  IndividualWidget(
                    text: "=",
                    color: Theme.of(context).primaryColor,
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

class IndividualWidget extends StatelessWidget {
  const IndividualWidget({
    super.key,
    required this.text,
    this.colspan = 4,
    this.color = Colors.white,
    this.textColor = Colors.black,
  });

  final String text;
  final double colspan;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      width: ((MediaQuery.of(context).size.width) / colspan) -
          (colspan == 2 ? 28 : 18),
      height: 100,
      child: Center(
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
