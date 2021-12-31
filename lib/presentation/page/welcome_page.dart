import 'package:flutter/material.dart';
import 'package:flutter_cubit_app/misc/colors.dart';
import 'package:flutter_cubit_app/presentation/widget/app_text_large.dart';
import 'package:flutter_cubit_app/presentation/widget/app_text_normal.dart';
import 'package:flutter_cubit_app/presentation/widget/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  static const images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          scrollBehavior: const ScrollBehavior(
            androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
          ),
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/${images[index]}'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 150, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        AppTextLarge(text: 'Trips'),
                        AppTextNormal(text: 'Mountain', size: 30),
                        SizedBox(height: 15),
                        SizedBox(
                          width: 250,
                          child: AppTextNormal(
                            text:
                                'Mountain hikes give you an incredible sense of freedom along with endurance test',
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ResponsiveButton(
                          width: 100,
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(images.length, (dotIndex) {
                        return Container(
                          width: 6,
                          margin: const EdgeInsets.only(bottom: 2),
                          height: index == dotIndex ? 22 : 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == dotIndex
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
