import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';

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
    return Scaffold(// map dos botoes
      backgroundColor: AppController.instance.mainColor,
      appBar: AppBar(
        backgroundColor: AppController.instance.mainColor,
        title: Center(child: Text("Dia "+myInstance.now.day.toString()+" - "+ Jiffy(myInstance.now).EEEE.toString())),
      ),
      body: SizedBox(
        child: Column(
          children: [

            CircleAvatar(
              backgroundImage: AssetImage('assets/images/pelezin.jpg'),
              radius: 40,
            ),
            Text("Pele",style: TextStyle(fontSize: 20),),
            Text("Nascimento: 05/10/2001",style: TextStyle(fontSize: 20),),
            Text("Idade: 35 anos",style: TextStyle(fontSize: 20),),
            Container(height: 80,),
            Row(
              children: [
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                    print("teste");
                  },
                  child: Text("Login",style: TextStyle(color: Colors.black),),


                ),
                Container(width: defaultPadding,),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/memories');
                    print("teste");
                  },
                  child: Text("MEMORIA",style: TextStyle(color: Colors.black),),
                Positioned(
                  child: Container(
                    child: IconButton(
                      onPressed: () {},
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
                radius: 80,
                backgroundImage: AssetImage('assets/images/pelezin.jpg'),
              ),
            ),
            Container(
              height: 10,
            ),
            Text(
              "Pele",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Container(
              height: 10,
            ),
            Text(
              "Nascimento: 05/10/2001",
              style: TextStyle(fontSize: 24),
            ),
            Container(
              height: 10,
            ),
            Text(
              "Idade: 35 anos",
              style: TextStyle(fontSize: 24),
            ),
            Container(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue, padding: EdgeInsets.all(15.0)),
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
                    primary: Colors.lightBlue,
                  ),
                  onPressed: () {},
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
                    padding: EdgeInsets.all(15.0),
                  ),
                  onPressed: () {},
                  child: Ink.image(
                    image: AssetImage("assets/icons/Familia.png"),
                    height: 58,
                    width: 58,
                  ),
                ),
              ],
            ),
            Container(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white,fixedSize: Size(260, 70) ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/localizationMenu');
                    print("teste");
                  },
                  child: Text("LOCALIZACAO",style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
