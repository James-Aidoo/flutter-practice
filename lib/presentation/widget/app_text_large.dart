import 'package:flutter/material.dart';

class AppTextLarge extends StatelessWidget {
  final double size;
  final String text;
  final Color color;

  const AppTextLarge(
      {Key? key, this.size = 30, required this.text, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
