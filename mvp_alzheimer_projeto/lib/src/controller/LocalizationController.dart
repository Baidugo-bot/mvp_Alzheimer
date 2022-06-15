import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';

import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;


class LocalizationController extends ChangeNotifier {
  static LocalizationController instance = LocalizationController();
  late MapController mapController ;
  final Geolocator geoLocator = Geolocator();
  bool isUpdating = false;
  bool onLocalPage = false;
  bool firstOpening=true;
  String myCode = ""; //send a update of location each x seconds, already have the function  on flutter map
  String targetCode = "";
  bool isCodeGenerated = false;
  bool isTargetCodeGenerated = false;
  bool updateRoutineRunning = false;
   LatLng _myPos = LatLng(0,0);
   late LocationContainer myPosition ;

  set myPos(LatLng val) => _myPos = val; // optionally perform validation, etc

  LatLng get myPos => _myPos;

  Future<void> initializeMapController() async {
    mapController = await MapController();

    await mapController.onReady.then((value) => print("Ready!"));

  }

  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;


    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();

  }

  Future<LatLng> getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(desiredAccuracy:  LocationAccuracy.high);
    return  LatLng(position.latitude,position.longitude);
  }
  
  
  void generateCode(){
    myCode = generateRandomString(9);
    isCodeGenerated=true;

    if(!updateRoutineRunning){
      updateRoutineRunning= true;
      Timer.periodic(Duration(seconds: 30), (Timer timer) =>
          LocalizationController.instance.getCurrentLocation().then(
                  (value)  =>
              (LocalizationController.instance.isTargetCodeGenerated)?LocalizationController.instance.sendLocation(value):timer.cancel()
          )//send that location to SQL
      );
    }
  }
  
  void tryFindTargetCode() async {

      targetCode = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel Scan", false, ScanMode.QR);
      print("CUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU"+targetCode.toString() + isTargetCodeGenerated.toString()+(targetCode.compareTo("-1")!=0).toString());
      if(targetCode!="" && targetCode!=null && targetCode.compareTo("-1")!=0){
        isTargetCodeGenerated = true;
        print("PINTOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"+targetCode.toString() + isTargetCodeGenerated.toString());

      }


  }

  void sendLocation(LatLng pos) async {
    print("mandando local");
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/main/request/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'token': myCode,
        'lat':pos.latitude.toString(),
        'long':pos.longitude.toString(),
      }),
    );
    print(response.body);
    if (response.statusCode == 201) {
      print("success");
    } else {
      throw Exception('Failed to create album.');
    }



  }

  Future<LatLng> getUpdatedTargetLocation() async {//http://10.0.2.2:8080/main/
      final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/main/response/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'token': targetCode,
      }),
    );
      dynamic posCollected = jsonDecode(response.body);

      if(posCollected["message"]!="Não encontrado"){
        return LatLng(double.parse(posCollected["lat"]) ,double.parse(posCollected["long"]));
      }else{
        return LatLng(0,0);
      }

  }

  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
  }

  
}


class LocationContainer{
   final String token;
   final pos;

  const LocationContainer({required this.token,required this.pos});

  void definePos(LatLng pos){
     //mypos = pos
    LocalizationController.instance.myPos = pos;
  }

  Map<String,dynamic> toJson() => {
    'token': token,
    'latitude':pos.latitude,
    'longitude':pos.longitude,
  };
}