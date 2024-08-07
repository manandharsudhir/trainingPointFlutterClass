import 'package:flutter/material.dart';

class IndividualWidget extends StatelessWidget {
  const IndividualWidget({
    super.key,
    required this.text,
    this.colspan = 4,
    this.color = Colors.white,
    this.textColor = Colors.black,
    required this.onTap,
  });

  final String text;
  final double colspan;
  final Color color;
  final Color textColor;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(text);
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
              text,
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
