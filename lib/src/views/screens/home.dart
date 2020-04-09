 import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget buildButton(Icon icon){
      return IconButton(
                icon: icon,
                color: Colors.white,
                onPressed: () {},
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF21BFBD),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    buildButton(Icon(Icons.arrow_back_ios)),
                  Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        buildButton(Icon(Icons.filter_list)),
                        buildButton(Icon(Icons.menu)),
                        
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 33.0),
            Padding(
              padding: EdgeInsets.only(left : 40.0),
              child: Row(
                children: <Widget>[
                  Text("Alt",
                    style : TextStyle(
                      fontFamily : 'Montserrat',
                      color : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0
                            )
                    ),
                    SizedBox(width: 10.0),
                    Text("SOAP",
                    style : TextStyle(
                      fontFamily : 'Montserrat',
                      color : Colors.white,
                     
                      fontSize: 25.0
                            )
                    ),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color : Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left : 25.0, right: 20.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top : 45.0),
                    child : Container(
                      height: MediaQuery.of(context).size.height - 300.0,
                      child: ListView(
                        children: <Widget>[
                            
                        ],
                        
                      ),
                      
                    ),
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   
                   children: <Widget>[
                     Container(
                       height: 58.0,
                       width: 55.0,
                       decoration: BoxDecoration(
                         border : Border.all(
                           color : Colors.grey,
                           style : BorderStyle.solid,
                           width : 1.0
                         ),
                         borderRadius: BorderRadius.circular(10.0)
                       ),
                       child: Icon(Icons.search,color : Colors.black),
                     ),
                     Container(
                       height: 58.0,
                       width: 55.0,
                       decoration: BoxDecoration(
                         border : Border.all(
                           color : Colors.grey,
                           style : BorderStyle.solid,
                           width : 1.0
                         ),
                         borderRadius: BorderRadius.circular(10.0)
                       ),
                       child: Icon(Icons.shopping_cart, color : Colors.black),
                     ),
                     Container(
                       height: 58.0,
                       width: 100.0,
                       decoration: BoxDecoration(
                         color : Colors.purple,
                         border : Border.all(
                           color : Colors.deepPurple,
                           style : BorderStyle.solid,
                           width : 1.0
                         ),
                         borderRadius: BorderRadius.circular(10.0)
                       ),
                       child: Center(
                         child : Text("Checkout")
                       )
                     ),
                   ],
                 )
                ],
              ),
            )
          ],
        ));
  }
}