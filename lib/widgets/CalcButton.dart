import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color fillColor;
  final Color textColor;
  final double textSize;
  final Function callback;

  const CalcButton({
    super.key,
    required this.text,
    this.icon,
    required this.fillColor,
    required this.textColor,
    required this.callback,
    this.textSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: fillColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: () => callback(text),
          child: Center(
            child: icon != null
                ? Icon(icon, color: textColor, size: textSize)
                : Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: textSize,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
