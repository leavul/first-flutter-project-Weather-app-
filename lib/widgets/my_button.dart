import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color fgColor;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.fgColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: bgColor,
      child: Text(
        text,
        style: TextStyle(color: fgColor),
      ),
    );
  }
}
