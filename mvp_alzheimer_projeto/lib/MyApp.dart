import 'package:flutter/material.dart';
/*import 'package:projeto_estudo/src/views/ConfigurationsView.dart';*/
import 'AppController.dart';
import 'MyHomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          initialRoute: '/',
          routes: {
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
