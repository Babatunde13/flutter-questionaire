import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;

  TextWidget({required this.text, this.color, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(2),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
