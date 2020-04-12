
 import 'dart:async';
import 'package:alt_soap/src/localStorage.dart';
import 'package:alt_soap/src/utils/utils.dart';
import 'package:alt_soap/src/views/screens/intro.dart';
import 'package:flutter/material.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   Screen size;

  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds : 2) ,(){
        Utils.goto(context,IntroScreen(),isReplace: false);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return Scaffold(
        body: Center(
        child: Container(
          width: size.getWidthPx(300),
          height: size.getWidthPx(300),
          child: Image.asset("images/alt.png")))
    );
  }

  
//test if new then go to intro screen 
//else login
   /* Future navigateFromSplash () async {

    String isOnBoard = await LocalStorage.sharedInstance.readValue(Constants.isOnBoard);
      print("isOnBoard  $isOnBoard");
      if(isOnBoard ==null || isOnBoard == "0"){
        //Navigate to OnBoarding Screen.
        Utils.goto(context,IntroScreen(),isReplace: false);
      }else{
        
      }
  } */

 
}