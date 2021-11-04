import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String text;
  Color? color;
  double? fontSize;

  TextWidget({required this.text, this.color, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
