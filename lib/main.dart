import 'package:flutter/material.dart';
import 'package:flutter_cubit_app/injection_container.dart';
import 'package:flutter_cubit_app/presentation/page/detail_page.dart';
import 'package:flutter_cubit_app/presentation/page/navpages/main_page.dart';
import 'package:flutter_cubit_app/presentation/page/welcome_page.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/main_page': (context) => const MainPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
