import 'package:alt_soap/src/views/screens/splash.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : "Test",
      theme : ThemeData(
        primarySwatch: Colors.lightGreen
      ),
      home : SplashScreen()
    );
  }
}