import 'dart:html';

import 'package:flutter/material.dart';

class FamilyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 0, 0, 0), accentColor: Colors.red),
      home: Home(),
    );

    title:
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
//botão volta menu principal
        // InkWell(
        //   onTap: () {
        //         Navigator.pushNamed(context, '/');
        //       },
        //       child: Icon(
        //         Icons.keyboard_return,
        //         color: Color.fromARGB(255, 173, 5, 5),
        //         size: 50.0,
        //       ),
        // ),
      ],
    );
  }
}

//Base da Applicação
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Familiares",
          style: TextStyle(fontSize: 25),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // IconButton(
              //     icon: Icon(Icons.keyboard_return,
              //         color: Color.fromARGB(255, 214, 11, 11), size: 50.0),
              //     onPressed: (){
                       
              //     }
              // )
            ],
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          TopBar(),
        ],
      ),
    );
  }
}

//corpo do programa
class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Container()],
    );
  }
}
