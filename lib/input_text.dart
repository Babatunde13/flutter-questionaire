import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  void Function(String)? onChanged;
  String? placeholder;

  InputTextWidget({this.onChanged, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: placeholder,
      ),
    );
  }
}
