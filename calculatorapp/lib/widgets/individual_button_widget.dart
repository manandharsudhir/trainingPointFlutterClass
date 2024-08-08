import 'package:calculatorapp/screens/calculator_screen.dart';
import 'package:flutter/material.dart';

class IndividualWidget extends StatelessWidget {
  const IndividualWidget({
    super.key,
    required this.btn,
    this.colspan = 4,
    this.color = Colors.white,
    this.textColor = Colors.black,
    required this.onTap,
  });

  final ButtonClass btn;
  final double colspan;
  final Color color;
  final Color textColor;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(btn.title);
      },
      child: Container(
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
              btn.title,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
