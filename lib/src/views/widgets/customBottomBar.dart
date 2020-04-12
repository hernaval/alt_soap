import 'package:alt_soap/src/utils/utils.dart';

import 'package:alt_soap/src/views/screens/map.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCurve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
         items: <Widget>[
      
      Icon(FontAwesomeIcons.home, size: 30),
      Icon(Icons.add, size: 30),
      Icon(FontAwesomeIcons.markdown, size: 30),
    ],
    onTap: (index) {
      if(index ==0) {
        //Utils.goto(context,IntroScreen(),isReplace : false);
      }
      if(index ==1){
        Utils.addingProviders(context);
      }
      if(index ==2){
        Utils.goto(context,MapPage(),isReplace : false);
      }
    },
  );
}
}