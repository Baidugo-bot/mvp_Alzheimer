

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:projeto_estudo/src/controller/LocalizationController.dart';
import 'MyApp.dart';
void main() {
  LocalizationController.instance.initializeMapController();


  LocalizationController.instance.generateCode();
  LocalizationController.instance.getUpdatedTargetLocation();
  LocalizationController.instance.targetCode = LocalizationController.instance.myCode;
  LocalizationController.instance.isTargetCodeGenerated=true;
  /*if(LocalizationController.instance.isTargetCodeGenerated){
    Timer.periodic(Duration(seconds: 8), (Timer timer) =>
        LocalizationController.instance.getCurrentLocation().then(
                (value)  =>
            (LocalizationController.instance.isTargetCodeGenerated)?LocalizationController.instance.sendLocation(value):timer.cancel()
        )//send that location to SQL
    );
  }*/
  runApp( MyApp());
  LocalizationController.instance.getPosition();


}



