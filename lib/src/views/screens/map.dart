

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
            width: 500,
            height: 500,
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(51.5, -0.09),
                zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate : 'https://api.mapbox.com/styles/v1/hernaval/ck8w3rbum2xvy1iqkdyglslro/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaGVybmF2YWwiLCJhIjoiY2s4dnhiOWlxMDQyNDNmcW9ocmYwa3pydyJ9.rPUIIZ0bvyuESCsjD3tAww',

                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 50.0,
                      height: 50.0,
                      point: LatLng(51.5, -0.09),
                      builder: (ctx) =>
                      Container(
                        child: FlutterLogo(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        
  
  }
}

//        urlTemplate : 'https://api.mapbox.com/styles/v1/hernaval/ck8w3rbum2xvy1iqkdyglslro/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaGVybmF2YWwiLCJhIjoiY2s4dnhiOWlxMDQyNDNmcW9ocmYwa3pydyJ9.rPUIIZ0bvyuESCsjD3tAww',
