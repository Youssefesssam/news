import 'package:flutter/material.dart';
import 'package:news/ui/screens/home.dart';


class SplashScreen  extends StatefulWidget {
  const SplashScreen ({super.key});
  static String routeName="splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/splash.png",fit: BoxFit.cover),
    );
  }
}
