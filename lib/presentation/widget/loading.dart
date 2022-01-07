import 'package:flutter/material.dart';
import 'package:flutter_cubit_app/misc/colors.dart';
import 'package:flutter_cubit_app/presentation/widget/app_text_normal.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingView extends StatelessWidget {
  final Color color;
  final String text;
  final double animSize;

  const LoadingView(
      {Key? key,
      this.color = AppColors.mainColor,
      this.text = 'Working. Please wait...',
      this.animSize = 70})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.white.withOpacity(0.9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpinKitThreeBounce(
            color: color,
            size: animSize,
          ),
          AppTextNormal(
            text: text,
            color: Colors.black.withOpacity(0.8),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
