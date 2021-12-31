import 'package:flutter/material.dart';

class AppTextNormal extends StatelessWidget {
  final double size;
  final String text;
  final Color color;

  const AppTextNormal(
      {Key? key,
      this.size = 16,
      required this.text,
      this.color = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
