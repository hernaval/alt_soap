import 'package:flutter/material.dart';

class Utils{
  Utils._();


//fonction pour le changement de page
  static goto(BuildContext context,Widget screen){
    Navigator.of(context)
    .push(MaterialPageRoute(builder : (context) => screen));
  }
}