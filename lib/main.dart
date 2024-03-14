import 'package:flutter/material.dart';
import 'package:news/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:({
        HomeScreen.routeName:(_)=>const HomeScreen()
      }),//
      initialRoute: HomeScreen.routeName,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
