import 'package:flutter/material.dart';
import 'package:flutter_cubit_app/misc/colors.dart';
import 'package:flutter_cubit_app/widget/app_text_normal.dart';

class ResponsiveButton extends StatelessWidget {
  final bool hasText;
  final double? width;
  final double height;
  final String text;
  const ResponsiveButton({
    Key? key,
    this.hasText = false,
    this.width = 100,
    this.height = 50,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: hasText ? double.maxFinite : width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: hasText
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            hasText
                ? Container(
                    margin: const EdgeInsets.only(left: 25),
                    child: AppTextNormal(text: text, color: Colors.white),
                  )
                : const SizedBox(),
            Container(
              padding: const EdgeInsets.all(5),
              child: Image.asset("images/button-one.png"),
            ),
          ],
        ),
      ),
    );
  }
}
