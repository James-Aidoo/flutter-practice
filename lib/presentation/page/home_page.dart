import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_app/data/storage/remote/remote_data_client.dart';
import 'package:flutter_cubit_app/domain/model/place.dart';
import 'package:flutter_cubit_app/injection_container.dart';
import 'package:flutter_cubit_app/misc/colors.dart';
import 'package:flutter_cubit_app/presentation/bloc/places_bloc.dart';
import 'package:flutter_cubit_app/presentation/components/circle_tab_indicator.dart';
import 'package:flutter_cubit_app/presentation/utils/route_names.dart';
import 'package:flutter_cubit_app/presentation/widget/app_text_large.dart';
import 'package:flutter_cubit_app/presentation/widget/app_text_normal.dart';

class HomePage extends StatefulWidget {
  final List<Place> places;

  const HomePage({Key? key, required this.places}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static const tabs = [
    Tab(text: "Places"),
    Tab(text: "Inspiration"),
    Tab(text: "Emotions")
  ];

  static const _activities = {
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkling',
    'balloning.png': 'Ballooning',
    'hiking.png': 'Hiking',
  };

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PlacesBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.menu,
                      color: Colors.black54,
                      size: 30,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.withOpacity(0.5)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const AppTextLarge(text: "Discover"),
                const SizedBox(
                  height: 20,
                ),
                TabBar(
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: const EdgeInsets.only(left: 0, right: 30),
                  indicator:
                      const CircleTabIndicator(4, AppColors.mainColor, 16),
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  controller: _tabController,
                  tabs: tabs,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  height: 300,
                  width: double.infinity,
                  child: TabBarView(controller: _tabController, children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.places.length,
                      itemBuilder: (context, index) {
                        double padding = index == widget.places.length ? 0 : 8;
                        return InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            RouteNames.detailPage,
                            arguments: widget.places[index],
                          ),
                          child: Container(
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  '${RemoteDataClient.baseImageUrl}/${widget.places[index].img}',
                                  scale: 1.0,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            margin: EdgeInsets.only(right: padding),
                          ),
                        );
                      },
                    ),
                    const Text('There'),
                    const Text('Bye'),
                  ]),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AppTextLarge(text: 'Explore more', size: 22),
                    AppTextNormal(text: 'See all', size: 18),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  width: double.maxFinite,
                  child: ListView.builder(
                    itemCount: _activities.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'images/${_activities.keys.elementAt(index)}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            AppTextNormal(
                              text: _activities.values.elementAt(index),
                              size: 14,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
