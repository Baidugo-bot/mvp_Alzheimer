import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jiffy/jiffy.dart';
import 'package:latlong2/latlong.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/controller/LocalizationController.dart';


class LocalizationView extends StatefulWidget {
  const LocalizationView({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<LocalizationView> createState() => LocalizationViewState();
}

class LocalizationViewState extends State<LocalizationView> {
  @override
  Widget build(BuildContext context) {
    var lat=-24.94558;
    var lng=-53.50780;
    return Scaffold(// map dos botoes
      backgroundColor: AppController.instance.mainColor,
      appBar: AppBar(
        backgroundColor: AppController.instance.mainColor,
        title: Center(child: Text("Map Page ")),
        actions: [
          InkWell(
            onTap: (){
              setState(() {
                LocalizationController.instance.getPosition();
                lat =   LocalizationController.instance.mapController.center.latitude;
                lng =  LocalizationController.instance.mapController.center.longitude;
                LocalizationController.instance.mapController.move(LatLng(-22.948946,-43.225631), 15.9);
              });
            },
            child: Icon(Icons.refresh),
          )
        ],
      ),
      body: FlutterMap(
        mapController:  LocalizationController.instance.mapController,
        options: MapOptions(
          center: LatLng(lat, lng),
          zoom: 15.9,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://api.mapbox.com/styles/v1/hugoomori/cl352g958002f16pjtd35538m/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaHVnb29tb3JpIiwiYSI6ImNsMzUxODZ1bjA3d3Mza21wOThvbDYxejYifQ.nnHPv3NEXheUbl30Hky1kQ",
            additionalOptions: {
              'accessToken': 'pk.eyJ1IjoiaHVnb29tb3JpIiwiYSI6ImNsMzUxODZ1bjA3d3Mza21wOThvbDYxejYifQ.nnHPv3NEXheUbl30Hky1kQ',
              'id': 'mapbox.mapbox-streets-v8'
            },
            attributionBuilder: (_) {

              return Text("© OpenStreetMap contributors");
            },
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 24.0,
                height: 24.0,
                point: LatLng(lat,lng),
                builder: (ctx) =>
                    Row(
                      children: [
                        Icon(Icons.square),

                      ],
                    )
              ),
              Marker(
                  width: 24.0,
                  height: 24.0,
                  point: LatLng(24.94558,53.50780),
                  builder: (ctx) =>
                      Row(
                        children: [
                          Icon(Icons.circle),

                        ],
                      )
              ),
            ],
          ),
        ],
      ),

    );
  }



}
