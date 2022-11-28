

import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:projeto_estudo/AppController.dart';


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

 // initPlatformState().then((value) => runApp( MyApp()));
 //  //LocalizationController.instance.getPosition();
 // BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);


}










Future<void> initPlatformState() async {
// Configure BackgroundFetch.
  var status = await BackgroundFetch.configure(BackgroundFetchConfig(
    minimumFetchInterval: 15,
    forceAlarmManager: false,
    stopOnTerminate: false,
    startOnBoot: true,
    enableHeadless: true,
    requiresBatteryNotLow: false,
    requiresCharging: false,
    requiresStorageNotLow: false,
    requiresDeviceIdle: false,
    requiredNetworkType: NetworkType.NONE,
  ), onBackgroundFetch, onBackgroundFetchTimeout);
// Schedule backgroundfetch for the 1st time it will execute with 1000ms delay.
// where device must be powered (and delay will be throttled by the OS).
  BackgroundFetch.scheduleTask(TaskConfig(
      taskId: "myTask",
      delay: 1000,
      periodic: false,
      stopOnTerminate: false,
      enableHeadless: false
  ));
}

void onBackgroundFetch(String taskId) async {
  print("launching");
  if(taskId == "myTask") {
    // print(DateTime.now());
    // AwesomeNotifications().createNotification(
    //     content: NotificationContent(
    //         id: DateTime.now().millisecond,
    //         channelKey: 'key1',
    //         title: 'my task',
    //         body: '${DateTime.now()}'));
    var cron = Cron();
    cron.schedule(
        Schedule.parse('*/7 ${DateTime.now().minute+1} ${DateTime.now().hour} * * *'),
            () async => {
            print(DateTime.now().toString()),
              AwesomeNotifications().createNotification(
                  content: NotificationContent(
                      id: DateTime.now().millisecond,
                      channelKey: 'key1',
                      title: 'my task',
                      body: '${DateTime.now()}')),

        });

  }
}

void backgroundFetchHeadlessTask(HeadlessTask task) async {
  var taskId = task.taskId;
  if(taskId == "myTask") {
    print("reached");
//TODO: perform tasks like — call api, DB and local notification etc…
  }


}
void onBackgroundFetchTimeout(String taskId) {
  print("[BackgroundFetch] TIMEOUT: $taskId");
  BackgroundFetch.finish(taskId);
}

