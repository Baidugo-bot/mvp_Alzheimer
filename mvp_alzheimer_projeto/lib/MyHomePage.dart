import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jiffy/jiffy.dart';
import 'package:projeto_estudo/AppController.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myInstance = AppController.instance;
  final style = ElevatedButton.styleFrom(primary: Colors.white,fixedSize: Size(120, 70));
  //light style theme =
  final defaultPadding = 20.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(// map dos botoes
      appBar: AppBar(
        title: Center(child: Text("Dia "+myInstance.now.day.toString()+" - "+ Jiffy(myInstance.now).EEEE.toString())),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/pelezin.jpg'),
              radius: 100,
            ),
            Text("Pele",style: TextStyle(fontSize: 20),),
            Text("Nascimento: 05/10/2001",style: TextStyle(fontSize: 20),),
            Text("Idade: 35 anos",style: TextStyle(fontSize: 20),),
            Container(height: 80,),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/reminders');
                    print("teste");
                  },
                  child: Text("LEMBRETES",style: TextStyle(color: Colors.black),),


                ),
                Container(width: defaultPadding,),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/memories');
                    print("teste");
                  },
                  child: Text("MEMORIA",style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
            Container(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/family');
                    print("teste");
                  },
                  child: Text("FAMILIA",style: TextStyle(color: Colors.black),),


                ),
                Container(width: defaultPadding,),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/profile');
                    print("teste");
                  },
                  child: Text("PERFIL",style: TextStyle(color: Colors.black),),
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
                    Navigator.of(context).pushNamed('/configurations');
                    print("teste");
                  },
                  child: Text("CONFIGURACAO",style: TextStyle(color: Colors.black),),


                ),
              ],
            ),
          ],
        ),
      ),
  //     floatingActionButton:  Container(
  //       height: 90.0,
  //       width: 90.0,
  //
  //       child: FloatingActionButton(
  //         shape: BeveledRectangleBorder(
  //             borderRadius: BorderRadius.zero
  //         ),
  //         backgroundColor: Colors.greenAccent,
  //         onPressed: () {
  //
  //         },
  //         child: Text('''+ Adicionar
  // lembretes
  //         '''),
  //
  //       ),
  //     ),

    );
  }



}
