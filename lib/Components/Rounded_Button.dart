import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  RoundedButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Material(
        elevation: 10,
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: 20, letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
