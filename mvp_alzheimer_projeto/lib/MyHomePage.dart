import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:projeto_estudo/MyApp.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/controller/ProfileController.dart';
import 'package:intl/intl.dart';
import 'package:projeto_estudo/src/controller/SessionController.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final style =
      ElevatedButton.styleFrom(primary: Colors.white, fixedSize: Size(120, 70));

  //light style theme =
  final defaultPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // map dos botoes
      backgroundColor: AppController.instance.mainColor,

      body: SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                Positioned(
                  child: Container(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/profilePaciente');
                      },
                      color: Colors.black,
                      icon: Icon(
                        Icons.account_circle_outlined,
                      ),
                      iconSize: 50.0,
                    ),
                  ),
                ),

                Positioned(
                  child: Container(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/patients');
                      },
                      color: Colors.black,
                      icon: Icon(
                        Icons.people,
                      ),
                      iconSize: 50.0,
                    ),
                  ),
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60,
              child: CircleAvatar(
                radius: 80,
                backgroundImage: ProfileController.instance.image,
              ),
            ),
            Container(
              height: 5,
            ),
            Text(
              ProfileController.instance.nome,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.black,
              ),
            ),
            Container(
              height: 5,
            ),
            Center(
              child: Text(
                "Nascimento: ${Jiffy(ProfileController.instance.dataNasc).format("dd/MM/yyyy")}",
                style: TextStyle(fontSize: 26,color: Colors.black),
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue, padding: EdgeInsets.all(28.0)),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/seeRemedioPaciente');
                  },
                  child: Ink.image(
                    image: AssetImage("assets/icons/Remedio.png"),
                    height: 58,
                    width: 58,
                  ),
                ),
                Container(
                  width: defaultPadding,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(28.0),
                    primary: Colors.lightBlue,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/memoryPaciente');
                    SessionController.instance.getMemories().then((value) =>Navigator.of(context).pushNamed('/memories'));
                  },
                  child: Ink.image(
                    image: AssetImage("assets/icons/Memoria.png"),
                    height: 58,
                    width: 58,
                  ),
                ),
                Container(
                  width: defaultPadding,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    padding: EdgeInsets.all(28.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/familyPaciente');
                    SessionController.instance.getFamily().then((value) =>Navigator.of(context).pushNamed('/family'));

                  },
                  child: Ink.image(
                    image: AssetImage("assets/icons/Familia.png"),
                    height: 58,
                    width: 58,
                  ),
                ),
              ],
            ),
            Container(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    padding: EdgeInsets.all(28.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/registerRemedio');
                  },
                  child: Ink.image(
                    image: AssetImage("assets/icons/Mapa.png"),
                    height: 58,
                    width: 58,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      /*     floatingActionButton:  Container(
         height: 90.0,
         width: 90.0,

         child: FloatingActionButton(
           shape: BeveledRectangleBorder(
               borderRadius: BorderRadius.zero
           ),
           backgroundColor: Colors.greenAccent,
           onPressed: () {

           },
           child: Text('''+ Adicionar
   lembretes
           '''),

         ),
       ), */
    );
  }
}
