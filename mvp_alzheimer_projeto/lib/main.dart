

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:projeto_estudo/src/controller/LocalizationController.dart';
import 'MyApp.dart';
void main() {
  LocalizationController.instance.initializeMapController();

  runApp( MyApp());
  LocalizationController.instance.getPosition();


}



