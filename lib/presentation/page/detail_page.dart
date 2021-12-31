import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit_app/misc/colors.dart';
import 'package:flutter_cubit_app/presentation/widget/app_button.dart';
import 'package:flutter_cubit_app/presentation/widget/app_text_large.dart';
import 'package:flutter_cubit_app/presentation/widget/app_text_normal.dart';
import 'package:flutter_cubit_app/presentation/widget/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  static const int _gottenStars = 4;
  int peopleSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/mountain.jpeg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.ellipsis_vertical),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 300,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppTextLarge(
                            text: 'Yosemite',
                            color: Colors.black.withOpacity(0.8),
                            size: 26,
                          ),
                          const AppTextLarge(
                            text: '\$250',
                            color: AppColors.mainColor,
                            size: 26,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: const [
                          Icon(
                            Icons.location_on,
                            size: 16,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(width: 3),
                          AppTextNormal(
                            text: 'USA, California',
                            color: AppColors.textColor1,
                            size: 14,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                size: 16,
                                color: index < _gottenStars
                                    ? AppColors.starColor
                                    : AppColors.textColor2,
                              );
                            }),
                          ),
                          const SizedBox(width: 5),
                          const AppTextNormal(text: '(4.0)'),
                        ],
                      ),
                      const SizedBox(height: 30),
                      AppTextLarge(
                        text: 'People',
                        size: 20,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(height: 5),
                      const AppTextNormal(
                        text: 'Number of people in your group',
                        size: 14,
                        color: AppColors.mainTextColor,
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 5,
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                peopleSizeIndex = index;
                              });
                            },
                            child: AppButton(
                              color: peopleSizeIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: peopleSizeIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              borderColor: peopleSizeIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              size: 50,
                              text: '${index + 1}',
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      AppTextLarge(
                        text: 'Description',
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(height: 5),
                      const AppTextNormal(
                          text:
                              'You must go for a travel. Travelling helps get rid of pressure. Go to the mountains to see nature'),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 16,
                right: 16,
                child: Row(
                  children: const [
                    AppButton(
                      color: AppColors.textColor2,
                      backgroundColor: Colors.white,
                      borderColor: AppColors.textColor2,
                      size: 50,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(width: 10),
                    ResponsiveButton(
                      hasText: true,
                      text: 'Book Trip Now',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
