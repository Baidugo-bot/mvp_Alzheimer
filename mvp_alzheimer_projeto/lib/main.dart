

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
  initializeDateFormatting('pt_BR', 'en_US').then((_) =>  runApp( MyApp()));
  //LocalizationController.instance.getPosition();
}


