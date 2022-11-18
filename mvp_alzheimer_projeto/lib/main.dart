

import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:cron/cron.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:projeto_estudo/src/controller/LocalizationController.dart';
import 'package:projeto_estudo/src/remedios/RegisterRemedio.dart';
import 'package:intl/date_symbol_data_file.dart';


import 'MyApp.dart';
Future<void> main() async {
 AwesomeNotifications().initialize(
     null, // icon for your app notification
     [
      NotificationChannel(
          channelKey: 'key1',
          channelName: 'Proto Coders Point',
          channelDescription: "Notification example",
          defaultColor: Color(0XFF9050DD),
          ledColor: Colors.white,
          playSound: true,
          enableLights:true,
          enableVibration: true
      )
     ]
 );
 runApp( MyApp());
  //LocalizationController.instance.getPosition();
}


