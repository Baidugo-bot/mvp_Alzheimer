import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LocalizationController extends ChangeNotifier {
  static LocalizationController instance = LocalizationController();
  final MapController mapController = MapController();
  bool controllerAlreadySet = false;

  Future<void> initializeMapController() async {
    await mapController.onReady;
  }
}