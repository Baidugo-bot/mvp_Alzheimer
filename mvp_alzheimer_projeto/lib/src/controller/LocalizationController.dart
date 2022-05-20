import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocalizationController extends ChangeNotifier {
  static LocalizationController instance = LocalizationController();
  final MapController mapController = MapController();
  final Geolocator geoLocator = Geolocator();
  bool controllerAlreadySet = false;

  Future<void> initializeMapController() async {
    await mapController.onReady;
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
}