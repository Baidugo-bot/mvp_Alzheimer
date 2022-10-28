import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:projeto_estudo/MyApp.dart';
import 'package:projeto_estudo/src/components/CustomButton.dart';

import 'src/controller/ProfileController.dart';

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
     DateTime agora = DateTime.now();
    print(
        (agora.difference(ProfileController.instance.dataNasc).inDays / 365)
            .toString()
            .substring(0, 2));
    return Scaffold(
      // map dos botoes
      backgroundColor: Color.fromRGBO(121,188,218, 1),
      appBar: CustomAppBar.instance.getNamedDefault(context, "",Center(child: Text('Menu'))),
      body: SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                Positioned(
                  child: Container(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/profile');
                      },
                      color: Colors.black,
                      icon: Icon(
                        Icons.account_circle_outlined,
                      ),
                      iconSize: 50.0,
                    ),
                  ),
                ),
              ],
            ),
             CircleAvatar(
              backgroundColor: Colors.white,
              radius: 85,
              child: CircleAvatar(
            backgroundImage: ProfileController.instance.image,
            radius: 100,
          )
          ),
            Container(
              height: 5,
            ),
             Text(
            "Nome: ${ProfileController.instance.nome}",
            style: TextStyle(fontSize: 24,),
          ),
            Container(
              height: 5,
            ),
            Text(
            "Nascimento: ${Jiffy(ProfileController.instance.dataNasc).format("MMMM do yyyy")}",
            style: TextStyle(fontSize: 24),
          ),
            Container(
              height: 5,
            ),
            Text(
            "Idade: ${(agora.difference(ProfileController.instance.dataNasc).inDays / 365).toString().substring(0, 2)}",
            style: TextStyle(fontSize: 20),
          ),
            Container(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(121,188,218, 1), padding: EdgeInsets.all(15.0)),
                  onPressed: () {},
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
                    padding: EdgeInsets.all(15.0),
                    primary: Color.fromRGBO(121,188,218, 1),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/memories');
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
                    primary: Color.fromRGBO(121,188,218, 1),
                    padding: EdgeInsets.all(15.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/family');
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
                    primary: Color.fromRGBO(121,188,218, 1),
                    padding: EdgeInsets.all(15.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
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
