
 import 'dart:async';

import 'package:alt_soap/src/constants/util.dart';
import 'package:alt_soap/src/views/screens/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds : 2) ,(){
        Utils.goto(context,HomeScreen());
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alt Soap "),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/alt.png")
          ],
        ),
      ),
     
    );
  }
}