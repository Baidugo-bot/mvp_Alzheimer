import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';


class LocalizationController extends ChangeNotifier {
  static LocalizationController instance = LocalizationController();
  late MapController mapController ;
  final Geolocator geoLocator = Geolocator();
  bool isUpdating = false;
  bool onLocalPage = false;
  bool firstOpening=true;
  String myCode = "";
  String targetCode = "";
  bool isCodeGenerated = false;
  bool isTargetCodeGenerated = false;
   LatLng _myPos = LatLng(0,0);

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
    print(position.latitude.toString()+position.longitude.toString());
    return  LatLng(position.latitude,position.longitude);
  }
  
  
  void generateCode(){
    myCode = generateRandomString(9);
    isCodeGenerated=true;
  }
  
  void tryFindTargetCode() async {

      targetCode = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel Scan", false, ScanMode.QR);


  }

  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
  }

  
}