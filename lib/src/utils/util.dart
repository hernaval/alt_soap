import 'dart:io';


import 'package:alt_soap/src/utils/Constants.dart';
import 'package:alt_soap/src/utils/utils.dart';
import 'package:alt_soap/src/views/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Utils{
  Utils._();


//fonction pour le changement de page
  static goto(BuildContext context, Widget screen, {bool isReplace = false}) {
    isReplace
        ? Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => screen))
        : Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => screen));
  }




  static Future<bool> checkConnection() async {
    ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());
    if ((connectivityResult == ConnectivityResult.mobile) ||
        (connectivityResult == ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }
  static bool isAndroidPlatform(){
    if (Platform.isAndroid) {
      return true;
      // Android-specific code
    } else if (Platform.isIOS) {
      // iOS-specific code
      return false;
    }
  }



  static void showAlert(
      BuildContext context, String title, String text, VoidCallback onPressed,bool cancelable) {
    var alert = Utils.isAndroidPlatform() ? AlertDialog: CupertinoAlertDialog (

      title: Text(title,overflow: TextOverflow.ellipsis,),

      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(text),
          ],
        ),
      ),

      actions: <Widget>[
        Utils.isAndroidPlatform()?FlatButton:CupertinoDialogAction(
            onPressed: onPressed,
            child: Text(
              "OK",
              style: TextStyle(color: Constants.clr_blue),
            ))
      ],
    );

    showDialog(
        context: context,
        barrierDismissible: cancelable,
        builder: (_) {
          return alert;
        });
  }

  static void showOkCancelAlert(
      BuildContext context, String title, String text, VoidCallback onPressed) {
    var alert = AlertDialog(
      title: Text(title),
      content: Container(
        child: Row(
          children: <Widget>[Text(text)],
        ),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: onPressed,
            child: Text(
              "OK",
              style: TextStyle(color: Colors.black87),
            )),
        FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(color: Constants.clr_blue),
            ))
      ],
    );

    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
    }


  static int getColorHexFromStr(String colorStr)
  {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  static void showConnection(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                  Icon(FontAwesomeIcons.userCircle, color: Loko.blue, size: 36),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  Text("Welcome",
                      style: TextStyle(
                          fontSize: 16, fontFamily: "GoogleSans Bold"))
                ]),
                Divider(),
                Text(
                    "Log in to find places for collections of used oils from different locations. You earn points as and when deliveries are made and earn goodies from 20 points",
                    style: TextStyle(fontSize: 14)),
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                ),
                FlatButton(
                  onPressed: () {
                   // _handleSignIn();
                    Navigator.pop(context);
                  },
                  child: InkWell(
                    onTap : () {
                      Utils.goto(context,LoginPage());
                    },
                    child : Row(
                    children: <Widget>[
          
                      Icon(FontAwesomeIcons.signInAlt),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                      ),
                      Text('Sign In')
                    ],
                  ),
                  )
                ),
              ],
            ),
          ));
        });
  }

  static void addingProviders(BuildContext context ){
    
    final usernameCtrl = TextEditingController();
    final quantityCtrl = TextEditingController();
    final activityCtrl = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Container(
                
                
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
            
              children: <Widget>[
                Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                  Icon(FontAwesomeIcons.userCircle, color: Loko.blue, size: 36),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  Text("Oil Providers",
                      style: TextStyle(
                          fontSize: 16, fontFamily: "GoogleSans Bold"))
                ]),
                Divider(),
                Text(
                    "Please fill all informations if you want to allow us collecting your oil",
                    style: TextStyle(fontSize: 14)),
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top : 12.0),
                  child: Container(
                      width: 250.0,
                      child: TextField(
                        controller: usernameCtrl,
                        decoration: InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter your username',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top : 12.0),
                  child: Container(
                      width: 250.0,
                      child: TextField(
                        controller: activityCtrl,
                        decoration: InputDecoration(
                            labelText: 'Your Activity',
                            hintText: 'Restaurant, Motel, Particular',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top : 12.0),
                  child: Container(
                      width: 250.0,
                      child: TextField(
                        controller: quantityCtrl,
                        decoration: InputDecoration(
                            labelText: 'Product Quantity per Months',
                            hintText: 'Quantity',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                ),

                Center(
          child: Row(children: <Widget>[
            Text("Pork contact ?",style : TextStyle(color :Colors.grey)),
            Switch(
            value: false,
            onChanged: (value) {
              
              print(value);
              /* setState(() {
                isSwitched = value;
                print(isSwitched);
              }); */
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Loko.somaryManga,
          ),
          ],)
        ),
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top : 8.0),
                    child: RaisedButton(
                    splashColor: Colors.yellow,
                    color: Loko.somaryMainty,
                    padding: EdgeInsets.all(12.0),
                    shape: StadiumBorder(),
                    onPressed: (){
                      submitProviders(usernameCtrl.text,activityCtrl.text,quantityCtrl.text,true);
                      Navigator.pop(context);
                      
                      //print("tafiditra");
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
              ),
                  ),
                ),
                
                
              ],
            ),
          ));
        });
  }

  



static void submitProviders(String username,String activity,String quantity,bool isPork) async{
    final db = Firestore.instance;
    DocumentReference ref = await db.collection("providers").add({
      "username" : "$username",
      "activity":"$activity",
      "quantity":"$quantity",
      "isPork":"$isPork",
    });

    
}
  


}
  
