import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit_app/data/storage/remote/remote_data_client.dart';
import 'package:flutter_cubit_app/domain/model/place.dart';
import 'package:flutter_cubit_app/misc/colors.dart';
import 'package:flutter_cubit_app/presentation/widget/app_button.dart';
import 'package:flutter_cubit_app/presentation/widget/app_text_large.dart';
import 'package:flutter_cubit_app/presentation/widget/app_text_normal.dart';
import 'package:flutter_cubit_app/presentation/widget/responsive_button.dart';

class DetailPage extends StatefulWidget {
  final Place place;

  const DetailPage({Key? key, required this.place}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int peopleSizeIndex = 0;

  @override
  void initState() {
    peopleSizeIndex = widget.place.selectedPeople - 1;
    super.initState();
  }

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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            '${RemoteDataClient.baseImageUrl}/${widget.place.img}'),
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
                      icon: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.menu)),
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
                            text: widget.place.name,
                            color: Colors.black.withOpacity(0.8),
                            size: 26,
                          ),
                          AppTextLarge(
                            text: '\$${widget.place.price}',
                            color: AppColors.mainColor,
                            size: 26,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(width: 3),
                          AppTextNormal(
                            text: widget.place.location,
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
                                color: index < widget.place.stars
                                    ? AppColors.starColor
                                    : AppColors.textColor2,
                              );
                            }),
                          ),
                          const SizedBox(width: 5),
                          AppTextNormal(
                              text: '(${widget.place.stars.toDouble()})'),
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
                        children: List.generate(widget.place.people, (index) {
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
                      AppTextNormal(text: widget.place.description),
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
                    Expanded(
                      child: ResponsiveButton(
                        hasText: true,
                        text: 'Book Trip Now',
                      ),
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
