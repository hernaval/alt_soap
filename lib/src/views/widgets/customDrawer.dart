import 'package:alt_soap/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends Drawer{
    Widget build(BuildContext context){
      return Drawer(
      
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Loko.somaryManga),
              arrowColor: Colors.red,
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/hernaval.jpg"),
                backgroundColor: Colors.white,
                child:Text("J"),
              ),
              accountName: Text(
                "Hernaval Ranarivola",
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text("hernavalasco@gmail.com",
                  style: TextStyle(color: Colors.white)),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage("images/alt.png"),
                  backgroundColor: Colors.grey[100],
                  child: Text("S"),
                ),CircleAvatar(
                  backgroundImage: AssetImage("images/greensoap.jpg"),
                  backgroundColor: Colors.grey[100],
                  child: Text("C"),
                )
              ],
            ),
            ListTile(
              
                title: Text("Mission & target "),
                trailing: Icon(FontAwesomeIcons.soap),
                onTap: () => _onTapItemDrawer(context, "First page")),
            ListTile(
                title: Text("Find providers"),
                trailing: Icon(Icons.favorite),
                onTap: () => _onTapItemDrawer(context, "Second page")),
            Divider(),
            ListTile(
                title: Text("Gift & Points"),
                trailing: Icon(FontAwesomeIcons.gift),
                onTap: () => _onTapItemDrawer(context, "Sixth page")),
           
            ListTile(
                title: Text("My account"),
                trailing: Icon(Icons.settings),
                onTap: () => _onTapItemDrawer(context, "Third page")),
            Container(
              margin: EdgeInsets.only(top : 150),
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left : 16),
                  child: Text("Logout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)) ,
                  ),
                    
                    Padding(
                      padding:  EdgeInsets.only(right: 16),
                      child : IconButton(
                        color : Colors.red,
                        onPressed: (){}, 
                        icon: Icon(FontAwesomeIcons.powerOff),
                        ),
                    )
                    
                ], direction: Axis.horizontal,
              ),
             )
          ],
        ),
  
      
      );
    }

    void _onTapItemDrawer(_, String title) {
   /*  Navigator.push(_, MaterialPageRoute(builder: (BuildContext context) {
      return SecondPage(
        title: title,
      );
    })); */
    
  }
}