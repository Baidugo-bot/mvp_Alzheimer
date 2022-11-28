import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/remedios/ModifyRemedio.dart';
import 'package:projeto_estudo/src/remedios/RegisterRemedio.dart';
import 'package:projeto_estudo/src/remedios/ViewRemedioPaciente.dart';
import 'package:projeto_estudo/src/remedios/ViewRemedioPage.dart';
import 'package:projeto_estudo/src/views/ConfigurationsView.dart';
import 'package:projeto_estudo/src/views/EditFamilyView.dart';
import 'package:projeto_estudo/src/views/FamilyPaciente.dart';
import 'package:projeto_estudo/src/views/MemoriesView.dart';
import 'package:projeto_estudo/src/views/MemoryPaciente.dart';
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
import 'package:projeto_estudo/src/views/SeeFamilyPaciente.dart';
import 'package:projeto_estudo/src/views/SeeFamilyView.dart';
import 'package:projeto_estudo/src/views/SeeMemoryPaciente.dart';
import 'package:projeto_estudo/src/views/ProfilePaciente.dart';
import 'package:projeto_estudo/src/views/SeeMemoryView.dart';

import 'AppController.dart';
import 'MyHomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData( colorSchemeSeed: Colors.white),
          initialRoute: '/login',//ternario (tipo)?rotapaciente,rotaCuidador
          routes: {
            '/': (context) => MyHomePage(
                  title: '',
                ),
            '/addReminder': (context) => MyHomePage(
                  title: '',
                ),
            '/editReminder': (context) => MyHomePage(
                  title: '',
                ),
            '/addMemory': (context) => AddMemoryView(),
            '/editMemory': (context) => EditMemoryView(),
            '/memories': (context) => MemoriesView(),
            '/reminders': (context) => ReminderView(),
            '/seeMemory': (context) => SeeMemoryView(),
            '/seeFamily': (context) => SeeFamilyView(),
            //push content on route
            '/seeReminder': (context) => MyHomePage(
                  title: '',
                ),
            '/configurations': (context) => ConfigurationsView(),
            '/editFamily': (context) => EditFamilyView(),
            '/family': (context) => FamilyView(),
            '/addFamily': (context) => AddFamily(),
            '/addperson': (context) => MyHomePage(
                  title: '',
                ),
            '/editperson': (context) => MyHomePage(
                  title: '',
                ),
            '/profile': (context) => ProfileView(),
            '/editProfile': (context) => EditProfile(),
            '/localizationMenu': (context) => MenuLocalizationView(
                  title: '',
                ),
            '/patients': (context) => PatientsView(),
            '/login': (context) => LoginView(),
            '/register': (context) => RegisterView(),
            '/registerPatient': (context) => RegisterPatientView(),
            '/': (context) => MyHomePage(
                  title: '',
                ),
            '/remedioPage': (context) => ViewRemedio('Remedio'),
            '/memoryPaciente': (context) => MemoriesPacienteView(),
            '/seememoryPaciente': (context) => SeeMemoryPaciente(),
            '/familyPaciente': (context) => FamilyPaciente(),
            '/profilePaciente': (context) => ProfilePaciente(),
            '/seeFamilyPaciente': (context) => SeeFamilyPaciente(),
            '/seeRemedioPaciente': (context) => ViewRemedioPaciente(''),
            '/registerRemedio': (context) => RegisterRemedio(),
            '/editarRemedio': (context) => ModifyRemedio(Remedio()),
            /*'/addReminder': (context) => MyHomePage(
                  title: '',
                ),*/
          },
        );
      },
    );
  }
}
