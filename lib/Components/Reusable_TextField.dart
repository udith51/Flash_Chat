import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final obscureText;
  final keyBoardType;
  final String hint;
  final Function onChanged;

  ReusableTextField(
      {this.hint, this.onChanged, this.obscureText, this.keyBoardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyBoardType,
      obscureText: obscureText,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1),
          borderRadius: BorderRadius.circular(32),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
