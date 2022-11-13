

import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:cron/cron.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:projeto_estudo/src/controller/LocalizationController.dart';
import 'MyApp.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

  final cron = Cron();
  cron.schedule(Schedule.parse('*/1 */56 */14 * * *'), () async => {
    print("oi"),
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'key1',
            title:'Não esqueça de nós',
            body: 'Lembra que voce tem alzheimeeeer.'
        )
    ),
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 2,
            channelKey: 'key1',
            title:'Segundo Alarme',
            body: 'Lembra que voce tem alzheimeeeer.'
        )
    ),
  });

  runApp( MyApp());
  //LocalizationController.instance.getPosition();
}


