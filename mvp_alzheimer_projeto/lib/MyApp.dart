import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/views/ConfigurationsView.dart';
import 'package:projeto_estudo/src/views/MemoriesView.dart';
import 'package:projeto_estudo/src/views/ReminderView.dart';
import 'package:projeto_estudo/src/views/FamilyView.dart';
import 'package:projeto_estudo/src/views/ProfileView.dart';
import 'package:projeto_estudo/src/views/EditProfileView.dart';
import 'package:projeto_estudo/src/views/AddFamily.dart';
import 'package:projeto_estudo/src/views/AddMemoryView.dart';
import 'package:projeto_estudo/src/views/ConfigurationsView.dart';
import 'package:projeto_estudo/src/views/EditMemoryView.dart';
import 'package:projeto_estudo/src/views/LocalizationConfigView.dart';
import 'package:projeto_estudo/src/views/LocalizationView.dart';
import 'package:projeto_estudo/src/views/LoginView.dart';
import 'package:projeto_estudo/src/views/MemoriesView.dart';
import 'package:projeto_estudo/src/views/MenuLocalizationView.dart';
import 'package:projeto_estudo/src/views/PatientsView.dart';
import 'package:projeto_estudo/src/views/RegisterPatientView.dart';
import 'package:projeto_estudo/src/views/RegisterView.dart';
import 'package:projeto_estudo/src/views/ReminderView.dart';
import 'package:projeto_estudo/src/views/FamilyView.dart';
import 'package:projeto_estudo/src/views/ProfileView.dart';
import 'package:projeto_estudo/src/views/SeeMemoryView.dart';

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
            debugShowCheckedModeBanner : false,
          theme: ThemeData.dark(),

          initialRoute: '/',
          routes: {
            '/': (context) => MyHomePage(title: '',),
            '/addReminder': (context) => MyHomePage(title: '',),
            '/editReminder': (context) => MyHomePage(title: '',),
            '/addMemory': (context) => AddMemoryView(),
            '/editMemory': (context) => EditMemoryView(),
            '/memories': (context) => MemoriesView(),
            '/reminders': (context) => ReminderView(),
            '/seeMemory': (context) => SeeMemoryView(),//push content on route
            '/seeReminder': (context) => MyHomePage(title: '',),
            '/configurations': (context) =>  ConfigurationsView(),
            '/family': (context) => FamilyView(),
            '/addFamily':(context) => AddFamily(),
            '/addperson': (context) => MyHomePage(title: '',),
            '/editperson': (context) => MyHomePage(title: '',),
            '/profile': (context) =>  ProfileView(),
            '/editProfile': (context) =>  EditProfile(),
            '/localization': (context) => LocalizationView(title: '',),
            '/localizationMenu': (context) => MenuLocalizationView(title: '',),
            '/patients': (context) => PatientsView(),
            '/login': (context) => LoginView(),
            '/register': (context) => RegisterView(),
            '/registerPatient': (context) => RegisterPatientView(),
            '/': (context) => MyHomePage(
                  title: '',
                ),
            /*'/addReminder': (context) => MyHomePage(
                  title: '',
                ),*/
          },

        );
      },
    );
  }
}
