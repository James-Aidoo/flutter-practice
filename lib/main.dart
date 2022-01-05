import 'package:flutter/material.dart';
import 'package:flutter_cubit_app/injection_container.dart';
import 'package:flutter_cubit_app/presentation/page/navpages/main_page.dart';
import 'package:flutter_cubit_app/presentation/page/welcome_page.dart';
import 'package:flutter_cubit_app/presentation/utils/route_names.dart';

import 'domain/model/place.dart';

void main() {
  // Call DI init function to register components
  registerCompononents();
  // run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      initialRoute: RouteNames.root,
      routes: {
        RouteNames.root: (context) => const WelcomePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == RouteNames.mainPage) {
          return MaterialPageRoute(
              builder: (context) =>
                  MainPage(places: settings.arguments as List<Place>));
        }
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
