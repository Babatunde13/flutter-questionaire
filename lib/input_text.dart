import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? placeholder;

  InputTextWidget({this.onChanged, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: placeholder,
      ),
    );
  }
}
