import 'package:flutter/material.dart';
import 'package:flutter_cubit_app/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double? width;
  const ResponsiveButton({Key? key, this.isResponsive = false, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/button-one.png"),
        ],
      ),
    );
  }
}
