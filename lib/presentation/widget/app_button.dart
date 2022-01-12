import 'package:flutter/material.dart';

import 'app_text_normal.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final double size;

  final String text;
  final IconData? icon;
  final bool isIcon;

  const AppButton(
      {Key? key,
      required this.color,
      required this.backgroundColor,
      required this.borderColor,
      required this.size,
      this.text = '',
      this.icon,
      this.isIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
      ),
      child: Center(
        child: isIcon
            ? Icon(icon, color: color, size: 18)
            : AppTextNormal(
                text: text,
                color: color,
              ),
      ),
    );
  }
}
