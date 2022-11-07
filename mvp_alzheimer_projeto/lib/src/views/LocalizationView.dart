//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'dart:async';
//
// import 'package:projeto_estudo/AppController.dart';
// import 'package:projeto_estudo/src/controller/LocalizationController.dart';
//
//
// class LocalizationView extends StatefulWidget {
//   const LocalizationView({Key? key, required this.title}) : super(key: key);
//
//
//   final String title;
//
//   @override
//   State<LocalizationView> createState() => LocalizationViewState();
// }
//
// class LocalizationViewState extends State<LocalizationView> {
//   @override
//   Widget build(BuildContext context) {
//
//     bool carregando = false;
//
//     MapController mapController = LocalizationController.instance.mapController;
//
//     void firstOpening(){
//       LocalizationController.instance.firstOpening=false;
//       setState(() {
//
//       });
//     }
//
//     void updateMarkers(LatLng value){
//
//       LocalizationController.instance.myPos = value;
//       mapController.move(value, 18);
//
//       carregando=false;
//     }
//
//     void updateMarkerOnly(LatLng value){
//
//
//     }
//
//
//
//       LocalizationController.instance.onLocalPage = true;
//
//       return Scaffold(// map dos botoes
//         backgroundColor: AppController.instance.mainColor,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: AppController.instance.mainColor,
//           title: Row(
//             children: [
//               InkWell(
//                 onTap: (){
//                   LocalizationController.instance.onLocalPage = false;
//                   Navigator.of(context).pushNamed('/localizationMenu');
//
//                 },
//                 child: Icon(Icons.arrow_back,size: 30,),
//               ),
//               Container(width: 10,),
//               Center(child: Text("Map Page "))
//             ],
//           ),
//           actions: [
//
//             InkWell(
//               onTap: (){
//                   LocalizationController.instance.getUpdatedTargetLocation().then(
//                           (value)  =>  updateMarkers(value));
//
//               },
//               child: Icon(Icons.refresh,size: 30,),
//             ),
//
//           ],
//         ),
//         body:(!LocalizationController.instance.isTargetCodeGenerated)?
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Codigo de alvo nao registrado, para acessar o recurso de localizacao registre um codigo."),
//               ElevatedButton(
//                 onPressed: (){
//                   LocalizationController.instance.tryFindTargetCode();
//                 },
//                 child: Text("Registrar codigo.",textAlign: TextAlign.center),
//               ),
//             ],
//           )
//           :
//           FlutterMap(// if target generated then show, after getting location from API, catch last known location
//
//           options: MapOptions(
//             onPositionChanged: (MapPosition pos,bool){
//               LocalizationController.instance.myPos = pos.center!;
//             } ,
//             onMapCreated: (map){
//
//
//               mapController = map;
//               LocalizationController.instance.getUpdatedTargetLocation().then(
//                       (value)  =>
//                   updateMarkers(value)
//               );
//               Timer.periodic(Duration(seconds: 8), (Timer timer) =>
//                   LocalizationController.instance.getUpdatedTargetLocation().then(
//                           (value)  =>
//                       (LocalizationController.instance.isTargetCodeGenerated)?updateMarkers(value):timer.cancel()
//                   )//send that location to SQL
//               );
//
//             },
//             controller:  mapController,
//             center: LocalizationController.instance.myPos,
//             zoom: 18,
//           ),
//           layers: [
//             TileLayerOptions(
//               urlTemplate: "https://api.mapbox.com/styles/v1/hugoomori/cl3z42ifu001h15qd56051vly/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaHVnb29tb3JpIiwiYSI6ImNsMzUxODZ1bjA3d3Mza21wOThvbDYxejYifQ.nnHPv3NEXheUbl30Hky1kQ",
//               additionalOptions: {
//                 'accessToken': 'pk.eyJ1IjoiaHVnb29tb3JpIiwiYSI6ImNsMzUxODZ1bjA3d3Mza21wOThvbDYxejYifQ.nnHPv3NEXheUbl30Hky1kQ',
//                 'id': 'mapbox.mapbox-streets-v8'
//               },
//               attributionBuilder: (_) {
//
//                 return Text("© OpenStreetMap contributors");
//               },
//             ),
//             MarkerLayerOptions(
//               markers: [
//                 Marker(
//                     width: 24.0,
//                     height: 24.0,
//                     point: LocalizationController.instance.myPos,
//                     builder: (ctx) =>
//                         Row(
//                           children: [
//                             Icon(Icons.square,color: Colors.blue,),
//
//                           ],
//                         )
//                 ),
//                 Marker(
//                     width: 24.0,
//                     height: 24.0,
//                     point: LocalizationController.instance.myPos,
//                     builder: (ctx) =>
//                         Row(
//                           children: [
//                             Icon(Icons.circle,color: Colors.lightBlueAccent),
//
//                           ],
//                         )
//                 ),
//               ],
//             ),
//           ],
//         ),
//
//       );
//
//   }
//
//
//
// }
