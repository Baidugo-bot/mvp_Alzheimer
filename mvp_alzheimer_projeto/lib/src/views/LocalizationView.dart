
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';

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

    bool carregando = false;

    MapController mapController = LocalizationController.instance.mapController;



    void updateMarkers(LatLng value){
      mapController.move(value, 16.5);
      LocalizationController.instance.myPos = value;
      print(LocalizationController.instance.myPos);
      carregando=false;
    }

    void updateMarkerOnly(LatLng value){

      LocalizationController.instance.myPos = value;
    }



      return Scaffold(// map dos botoes
        backgroundColor: AppController.instance.mainColor,
        appBar: AppBar(
          backgroundColor: AppController.instance.mainColor,
          title: Center(child: Text("Map Page ")),
          actions: [
            InkWell(
              onTap: (){
                  LocalizationController.instance.getCurrentLocation().then(
                          (value)  =>  updateMarkers(value));

              },
              child: Icon(Icons.refresh,size: 45,),
            ),

          ],
        ),
        body: FlutterMap(

          options: MapOptions(
            onMapCreated: (map){
              mapController = map;
              LocalizationController.instance.getCurrentLocation().then(
                      (value)  => updateMarkers(value));

              Timer.periodic(Duration(seconds: 5), (Timer t) =>
                  LocalizationController.instance.getCurrentLocation().then(
                          (value)  =>  updateMarkers(value))

              );
            },
            controller:  mapController,
            center: LocalizationController.instance.myPos,
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
                    point: LocalizationController.instance.myPos,
                    builder: (ctx) =>
                        Row(
                          children: [
                            Icon(Icons.square,color: Colors.blue,),

                          ],
                        )
                ),
                Marker(
                    width: 24.0,
                    height: 24.0,
                    point: LocalizationController.instance.myPos,
                    builder: (ctx) =>
                        Row(
                          children: [
                            Icon(Icons.circle,color: Colors.lightBlueAccent),

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
