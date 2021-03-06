import 'package:flutter/material.dart';
import 'package:flutter_cubit_app/domain/model/place.dart';
import 'package:flutter_cubit_app/presentation/page/navpages/bar_item_page.dart';
import 'package:flutter_cubit_app/presentation/page/navpages/my_page.dart';
import 'package:flutter_cubit_app/presentation/page/navpages/search_page.dart';

import '../home_page.dart';

class MainPage extends StatefulWidget {
  final List<Place> places;

  const MainPage({Key? key, required this.places}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(places: widget.places),
      const BarItemPage(),
      const SearchPage(),
      const MyPage()
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black54,
        currentIndex: currentNavIndex,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            label: "Bar",
            icon: Icon(Icons.bar_chart),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "My",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      currentNavIndex = index;
    });
  }
}
