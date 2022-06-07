import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/views/ConfigurationsView.dart';
import 'package:projeto_estudo/src/views/MemoriesView.dart';
import 'package:projeto_estudo/src/views/ReminderView.dart';
import 'package:projeto_estudo/src/views/FamilyView.dart';
import 'package:projeto_estudo/src/views/ProfileView.dart';
import 'package:projeto_estudo/src/views/EditProfileView.dart';
import 'AppController.dart';
import 'MyHomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          initialRoute: '/',
          routes: {
            '/': (context) => MyHomePage(title: '',),
            '/addReminder': (context) => MyHomePage(title: '',),
            '/editReminder': (context) => MyHomePage(title: '',),
            '/addMemory': (context) => MyHomePage(title: '',),
            '/editMemory': (context) => MyHomePage(title: '',),
            '/memories': (context) => MemoriesView(),
            '/reminders': (context) => ReminderView(),
            '/seeMemory': (context) => MyHomePage(title: '',),//push content on route
            '/seeReminder': (context) => MyHomePage(title: '',),
            '/configurations': (context) =>  ConfigurationsView(),
            '/family': (context) => FamilyView(),
            '/addperson': (context) => MyHomePage(title: '',),
            '/editperson': (context) => MyHomePage(title: '',),
            '/profile': (context) =>  ProfileView(),
            '/editProfile': (context) =>  EditProfile(),
            '/localization': (context) => MyHomePage(title: '',),
          },

        );
      },
    );
  }
}
