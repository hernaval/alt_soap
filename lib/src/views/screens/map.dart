

import 'package:alt_soap/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapController _mapController;
  var points = <LatLng>[
    LatLng(51.5,-0.09),
    LatLng(53.3498,-6.2603),
    LatLng(48.8566,2.23522)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mapController = new MapController();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plusCircle,
        ), 
        onPressed: () {
            var newZoom = _mapController.zoom  -1;
            _mapController.move(_mapController.center, newZoom); 
           
        },
      ),
      
      body : Stack(
        children: <Widget>[
           FlutterMap(
        mapController: _mapController,
              options: MapOptions(
                center: LatLng(51.5,-0.09),
                zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate : 'https://api.mapbox.com/styles/v1/hernaval/ck8w3rbum2xvy1iqkdyglslro/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaGVybmF2YWwiLCJhIjoiY2s4dnhiOWlxMDQyNDNmcW9ocmYwa3pydyJ9.rPUIIZ0bvyuESCsjD3tAww',

                ),
                new PolylineLayerOptions(
                  polylines: [
                    Polyline(
                      points:  points ,
                      color : Loko.somaryManga    ,
                      strokeWidth: 4.0               
                      )
                  ]
                ),
                
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 50.0,
                      height: 50.0,
                      point: LatLng(51.5,-0.09),
                      builder: (ctx) =>
                      Container(
                        child: Icon(FontAwesomeIcons.googlePlus,
                         color : Loko.somaryMainty,
                         size : 30),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top : 70,
              left : 35,
height: 50,
width: 300,
child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color : Colors.white,
                borderRadius: BorderRadius.circular(3.0),
                boxShadow: [
                  BoxShadow(
                    color : Colors.grey,
                    offset: Offset(1.0,5.0),
                    blurRadius: 10,
                    spreadRadius: 3
                  )
                ]
              ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search your location",
                    icon : Container(
                      margin  : EdgeInsets.only(left : 20,top : 5),
                      child : Icon(FontAwesomeIcons.searchLocation,color : Colors.grey)
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left : 15,top : 16)
                  ),
                ),
              )
            )
            
        ],
      )
            
    );
          
        
  
  }
}

//        urlTemplate : 'https://api.mapbox.com/styles/v1/hernaval/ck8w3rbum2xvy1iqkdyglslro/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaGVybmF2YWwiLCJhIjoiY2s4dnhiOWlxMDQyNDNmcW9ocmYwa3pydyJ9.rPUIIZ0bvyuESCsjD3tAww',
